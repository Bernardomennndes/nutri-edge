// import '../tamagui-web.css'
import { useColorScheme } from 'react-native';

import {
  DarkTheme,
  DefaultTheme,
  ThemeProvider,
} from '@react-navigation/native';
import { Stack } from 'expo-router';
import { TamaguiProvider } from 'tamagui';

import { tamaguiConfig } from '../tamagui.config';

import '../global.css';

export default function RootLayout() {
  const colorScheme = useColorScheme();
  return (
    <TamaguiProvider config={tamaguiConfig}>
      <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
        <Stack>
          <Stack.Screen
            name='modal'
            options={{ presentation: 'modal' }}
          />
        </Stack>
      </ThemeProvider>
    </TamaguiProvider>
  );
}
