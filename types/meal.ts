import { Food } from './food';

export type Meal = {
  id: number;
  name: string;
  foods: Food[];
  totalCalories: number;
};
