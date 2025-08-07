import type { Product, MealItem } from '$lib/types';

export class NutritionalValuesUtils {
  static nutritionalValueKeys: (keyof Product['nutritionalValue'])[] = [
    'calories',
    'protein',
    'salt',
    'fibers',
    'lipids',
    'lipidsSaturated',
    'carbohydrates',
    'carbohydratesSugars',
    'nutriScore',
  ] as const satisfies (keyof Product['nutritionalValue'])[];

  static prettyPrintUnitsTable: Record<keyof Product['nutritionalValue'], string> = {
    calories: 'kCal',
    protein: 'g',
    salt: 'g',
    fibers: 'g',
    lipids: 'g',
    lipidsSaturated: 'g',
    carbohydrates: 'g',
    carbohydratesSugars: 'g',
    nutriScore: '', // NutriScore does not have a unit
  };

  static prettyPrintNutritionalValueValue = (
    key: (typeof NutritionalValuesUtils.nutritionalValueKeys)[number],
    value: Product['nutritionalValue'][keyof Product['nutritionalValue']],
    { decimals = 1 }: { decimals?: number } = {}
  ) => {
    const prettyVal = typeof value === 'number' ? value.toFixed(decimals) : value;
    return key in NutritionalValuesUtils.prettyPrintUnitsTable
      ? `${prettyVal} ${NutritionalValuesUtils.prettyPrintUnitsTable[key]}`
      : prettyVal;
  };

  static calculateTotalNutritionalValue(
    products: MealItem[],
    key: keyof Exclude<Product['nutritionalValue'], undefined>
  ): number {
    return products.reduce((total, entry) => {
      const nutrition = entry.product.nutritionalValue;
      const value = nutrition?.[key];
      return total + (typeof value === 'number' ? value * entry.quantity : 0);
    }, 0);
  }
}
