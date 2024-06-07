// import '../tamagui-web.css'

import { DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { Stack } from 'expo-router';
import { TamaguiProvider } from 'tamagui';

import { tamaguiConfig } from '../tamagui.config';

import '../global.css';

export default function RootLayout() {
  return (
    // add this
    <TamaguiProvider config={tamaguiConfig}>
      <ThemeProvider value={DefaultTheme}>
        <Stack>
          <Stack.Screen
            name='(tabs)'
            options={{ headerShown: false }}
          />
        </Stack>
      </ThemeProvider>
    </TamaguiProvider>
  );
}
