import { Platform } from 'react-native';

const IOS_SYSTEM_COLORS = {
  black: 'rgb(0, 0, 0)',
  dark: {
    background: 'rgb(0, 0, 0)',
    card: 'rgb(28, 28, 30)',
    destructive: 'rgb(254, 67, 54)',
    foreground: 'rgb(255, 255, 255)',
    grey: 'rgb(142, 142, 147)',
    grey2: 'rgb(99, 99, 102)',
    grey3: 'rgb(70, 70, 73)',
    grey4: 'rgb(55, 55, 57)',
    grey5: 'rgb(40, 40, 42)',
    grey6: 'rgb(21, 21, 24)',
    primary: 'rgb(3, 133, 255)',
    root: 'rgb(0, 0, 0)',
  },
  light: {
    background: 'rgb(242, 242, 247)',
    card: 'rgb(255, 255, 255)',
    destructive: 'rgb(255, 56, 43)',
    foreground: 'rgb(0, 0, 0)',
    grey: 'rgb(142, 142, 147)',
    grey2: 'rgb(175, 176, 180)',
    grey3: 'rgb(199, 199, 204)',
    grey4: 'rgb(210, 210, 215)',
    grey5: 'rgb(230, 230, 235)',
    grey6: 'rgb(242, 242, 247)',
    primary: 'rgb(0, 123, 254)',
    root: 'rgb(255, 255, 255)',
  },
  white: 'rgb(255, 255, 255)',
} as const;

const ANDROID_COLORS = {
  black: 'rgb(0, 0, 0)',
  dark: {
    background: 'rgb(0, 0, 0)',
    card: 'rgb(16, 19, 27)',
    destructive: 'rgb(147, 0, 10)',
    foreground: 'rgb(255, 255, 255)',
    grey: 'rgb(193, 198, 215)',
    grey2: 'rgb(139, 144, 160)',
    grey3: 'rgb(54, 57, 66)',
    grey4: 'rgb(49, 53, 61)',
    grey5: 'rgb(39, 42, 50)',
    grey6: 'rgb(16, 19, 27)',
    primary: 'rgb(3, 133, 255)',
    root: 'rgb(0, 0, 0)',
  },
  light: {
    background: 'rgb(249, 249, 255)',
    card: 'rgb(255, 255, 255)',
    destructive: 'rgb(186, 26, 26)',
    foreground: 'rgb(0, 0, 0)',
    grey: 'rgb(24, 28, 35)',
    grey2: 'rgb(65, 71, 84)',
    grey3: 'rgb(113, 119, 134)',
    grey4: 'rgb(193, 198, 215)',
    grey5: 'rgb(215, 217, 228)',
    grey6: 'rgb(249, 249, 255)',
    primary: 'rgb(0, 112, 233)',
    root: 'rgb(255, 255, 255)',
  },
  white: 'rgb(255, 255, 255)',
} as const;

const COLORS = Platform.OS === 'ios' ? IOS_SYSTEM_COLORS : ANDROID_COLORS;

export { COLORS };
