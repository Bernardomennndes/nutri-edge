import { userInfoSchema, userMetricsSchema, userSchema } from '~/lib/schemas';
import { z } from 'zod';
import { create } from 'zustand';

type User = z.infer<typeof userSchema>;
type UserMetrics = z.infer<typeof userMetricsSchema>;
type UserInfo = z.infer<typeof userInfoSchema>;

type UserStore = {
  setInfo: (info: UserInfo) => void;
  setMetrics: (metrics: UserMetrics) => void;
  user: User;
};

export const useUserStore = create<UserStore>((set) => ({
  setInfo: (info) =>
    set((prevValues) => ({ user: { ...prevValues.user, info } })),
  setMetrics: (metrics) =>
    set((prevValues) => ({ user: { ...prevValues.user, metrics } })),
  user: {
    info: {
      birthDate: new Date(),
      name: '',
    },
    metrics: {
      fat: 0,
      height: 0,
      weight: 0,
    },
  },
}));
