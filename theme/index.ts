import { Theme } from '@react-navigation/native';

import { COLORS } from './colors';

const NAV_THEME: { dark: Theme; light: Theme } = {
  dark: {
    colors: {
      background: COLORS.dark.background,
      border: COLORS.dark.grey5,
      card: COLORS.dark.grey6,
      notification: COLORS.dark.destructive,
      primary: COLORS.dark.primary,
      text: COLORS.white,
    },
    dark: true,
  },
  light: {
    colors: {
      background: COLORS.light.background,
      border: COLORS.light.grey5,
      card: COLORS.light.card,
      notification: COLORS.light.destructive,
      primary: COLORS.light.primary,
      text: COLORS.black,
    },
    dark: false,
  },
};

export { NAV_THEME };
