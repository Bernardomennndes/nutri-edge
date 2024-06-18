import { Meal } from './meal';

export type Diet = {
  id: number;
  name: string;
  description: string;
  meals: Meal[];
  mealsQuantity: number;
  totalCalories: number;
};
