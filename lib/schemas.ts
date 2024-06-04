import { z } from 'zod';

const userMetricsSchema = z.object({
  weight: z.number({ message: 'Campo obrigatório.' }).min(10),
  height: z.number({ message: 'Campo obrigatório.' }).min(100),
  fat: z.number().min(0).max(1).optional(),
});

const userInfoSchema = z.object({
  name: z
    .string({ message: 'Campo obrigatório.' })
    .min(3, { message: 'O nome deve conter no mínimo 3 caracteres.' }),
  birthDate: z.date({ message: 'Campo obrigatório.' }),
});

export const userSchema = z.object({
  info: userInfoSchema,
  metrics: userMetricsSchema,
});
