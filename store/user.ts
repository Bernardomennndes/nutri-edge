import { z } from 'zod';
import { create } from 'zustand';
import { userInfoSchema, userMetricsSchema, userSchema } from '~/lib/schemas';

type User = z.infer<typeof userSchema>;
type UserMetrics = z.infer<typeof userMetricsSchema>;
type UserInfo = z.infer<typeof userInfoSchema>;

type UserStore = {
  user: User;
  setInfo: (info: UserInfo) => void;
  setMetrics: (metrics: UserMetrics) => void;
};

export const useUserStore = create<UserStore>((set) => ({
  user: {
    info: {
      name: '',
      birthDate: new Date(),
    },
    metrics: {
      weight: 0,
      height: 0,
      fat: 0,
    },
  },
  setInfo: (info) => set((prevValues) => ({ user: { ...prevValues.user, info } })),
  setMetrics: (metrics) => set((prevValues) => ({ user: { ...prevValues.user, metrics } })),
}));
