import type { NutritionMapEntry, Product, ProductCardProductGroup, ProductList } from '$lib/types';
import pool from '.';
import { PgCaching } from './caching';

export class ProductDAO {
  static convertToProduct(row: Record<string, never>): Product {
    return {
      id: row.id,
      image: row.image,
      name: row.name,
      categories: row.categories ?? [],
      itemLabel: row.item_label ?? null,
      nutritionalValue: {
        calories: row.calories,
        protein: row.protein,
        salt: row.salt,
        fibers: row.fibers,
        lipids: row.lipids,
        lipidsSaturated: row.lipids_saturated,
        carbohydrates: row.carbohydrates,
        carbohydratesSugars: row.carbohydrates_sugars,
        nutriScore: row.nutri_score,
      },
    };
  }

  static async createProduct(product: Product): Promise<void> {
    const result = await pool.query(
      'INSERT INTO product (name, image, calories, protein, salt, fibers, lipids, lipids_saturated, carbohydrates, carbohydrates_sugars, nutri_score) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *',
      [
        product.id,
        product.name,
        product.image,
        product.nutritionalValue.calories,
        product.nutritionalValue.protein,
        product.nutritionalValue.salt,
        product.nutritionalValue.fibers,
        product.nutritionalValue.lipids,
        product.nutritionalValue.lipidsSaturated,
        product.nutritionalValue.carbohydrates,
        product.nutritionalValue.carbohydratesSugars,
        product.nutritionalValue.nutriScore,
      ]
    );
    if (result.rows.length === 0) {
      throw new Error('Failed to create product');
    }
  }

  static async getAllItems(): Promise<NutritionMapEntry[]> {
    const items = await Promise.all([
      ProductDAO.getAllProducts(),
      ProductDAO.getAllProductGroups(),
    ]);
    return items.flat();
  }

  static async getAllProducts(): Promise<ProductList> {
    const result = await pool.query(
      'SELECT id FROM product WHERE id not in (SELECT product_id FROM belong_to_group)'
    );
    const products: ProductList = await Promise.all(
      result.rows.map(async (row) => {
        const product = await ProductDAO.getProductById(row.id);
        return product;
      })
    );
    return products;
  }

  static async getAllProductGroups(): Promise<ProductCardProductGroup[]> {
    const result = await pool.query('SELECT id FROM product_group');
    const groups: ProductCardProductGroup[] = await Promise.all(
      result.rows.map(async (row) => {
        const group = await ProductDAO.getProductGroup(row.id);
        return group;
      })
    );
    return groups;
  }

  static async getProductGroupById(id: ProductCardProductGroup['key']) {
    const cachedGroup = await PgCaching.get(`productGroup:${id}`);
    if (cachedGroup) return cachedGroup;
    if (await ProductDAO.isProductInAGroup(id)) {
      const productGroup = await ProductDAO.getProductGroupId(id);
      const group = await ProductDAO.getProductGroup(productGroup);
      await PgCaching.set(`productGroup:${id}`, group);
      return group;
    }
    throw new Error('Product group not found');
  }

  static async getProductById(
    id: Product['id'] | ProductCardProductGroup['key']
  ): Promise<NutritionMapEntry> {
    const cachedProduct = await PgCaching.get(`product:${id}`);
    if (cachedProduct) return cachedProduct;

    const result = await pool.query('SELECT * FROM product WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      throw new Error('Product not found');
    }
    const product = ProductDAO.convertToProduct(result.rows[0]);
    product.categories = await ProductDAO.getProductCategories(product.id);
    await PgCaching.set(`product:${id}`, product);
    return product;
  }

  static async getProductCategories(id: Product['id']): Promise<string[]> {
    const cachedCategories = await PgCaching.get(`product:${id}:categories`);
    if (cachedCategories) return cachedCategories;

    const result = await pool.query(
      'SELECT c.label FROM category c JOIN belong_in_category bic ON c.id = bic.category_id WHERE bic.product_id = $1',
      [id]
    );
    if (result.rows.length === 0) {
      return [];
    }
    await PgCaching.set(
      `product:${id}:categories`,
      result.rows.map((row) => row.label)
    );
    return result.rows.map((row) => row.label);
  }

  static async isProductInAGroup(productId: Product['id']): Promise<boolean> {
    const cached = await PgCaching.get(`product:${productId}:inGroup`);
    if (cached !== null) return cached;

    const result = await pool.query('SELECT COUNT(*) FROM belong_to_group WHERE product_id = $1', [
      productId,
    ]);
    const inGroup = parseInt(result.rows[0].count, 10) > 0;
    await PgCaching.set(`product:${productId}:inGroup`, inGroup);
    return inGroup;
  }

  static async getProductGroupId(productId: Product['id']): Promise<string> {
    const cachedGroupId = await PgCaching.get(`product:${productId}:groupId`);
    if (cachedGroupId) return cachedGroupId;

    const result = await pool.query('SELECT group_id FROM belong_to_group WHERE product_id = $1', [
      productId,
    ]);
    const groupId = result.rows[0]?.group_id;
    if (!groupId) {
      throw new Error('Product is not in a group');
    }
    await PgCaching.set(`product:${productId}:groupId`, groupId);
    return groupId;
  }

  static async getProductGroup(groupId: string): Promise<ProductCardProductGroup> {
    const cachedGroup = await PgCaching.get(`productGroup:${groupId}`);
    if (cachedGroup) return cachedGroup;

    const groupLabelRes = await pool.query('SELECT label FROM product_group WHERE id = $1', [
      groupId,
    ]);
    if (groupLabelRes.rows.length === 0) {
      throw new Error('Group not found');
    }
    const groupLabel = groupLabelRes.rows[0].label as string;
    const result = await pool.query('SELECT product_id FROM belong_to_group WHERE group_id = $1', [
      groupId,
    ]);
    if (result.rows.length === 0) {
      throw new Error('Group not found');
    }
    const group: ProductCardProductGroup = {
      key: groupId,
      label: groupLabel,
      activeIndex: 0,
      items: [],
    };
    group.items = await Promise.all(
      result.rows.map(async (row) => {
        const product = (await ProductDAO.getProductById(row.product_id)) as Product;
        return product;
      })
    );
    await PgCaching.set(`productGroup:${groupId}`, group);
    return group;
  }
}
