import { z } from 'zod';

export const userMetricsSchema = z.object({
  fat: z.number().min(0).max(1).optional(),
  height: z.number({ message: 'Campo obrigatório.' }).min(100),
  weight: z.number({ message: 'Campo obrigatório.' }).min(10),
});

export const userInfoSchema = z.object({
  birthDate: z.date({ message: 'Campo obrigatório.' }),
  name: z
    .string({ message: 'Campo obrigatório.' })
    .min(3, { message: 'O nome deve conter no mínimo 3 caracteres.' }),
});

export const userSchema = z.object({
  info: userInfoSchema,
  metrics: userMetricsSchema,
});
