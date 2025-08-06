export const nutriScoreValues = ['A', 'B', 'C', 'D', 'E'] as const;
export type UUID = string;

export interface ProductCardProductGroup {
  items: Product[];
  id: string;
  label: string;
  activeIndex: number;
}

export interface Product {
  id: UUID;
  image: string;
  name: string;
  categories: string[];
  itemLabel?: string;
  nutritionalValue: {
    calories: number;
    protein: number;
    salt: number;
    fibers: number;
    lipids: number;
    lipidsSaturated: number;
    carbohydrates: number;
    carbohydratesSugars: number;
    nutriScore?: (typeof nutriScoreValues)[number];
  };
}

export type NutritionMapEntry = Product | ProductCardProductGroup;

export type ProductList = NutritionMapEntry[];

export const isGroup = (item: NutritionMapEntry | undefined): item is ProductCardProductGroup => {
  return item !== undefined && 'items' in item && 'label' in item && 'activeIndex' in item;
};

export interface MealItem {
  product: Product;
  quantity: number;
}

export interface Meal {
  id: UUID;
  date: Date;
  items: MealItem[];
  userId: UUID;
}

export interface User {
  id: UUID;
  username: string;
  passwordHash: string;
  createdAt: Date;
  meals: Meal[];
}
