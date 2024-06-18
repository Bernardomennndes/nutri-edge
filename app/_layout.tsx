// import '../tamagui-web.css'

import { Stack } from 'expo-router';
import { TamaguiProvider } from 'tamagui';

import { tamaguiConfig } from '../tamagui.config';

import '../global.css';

export default function RootLayout() {
  return (
    <TamaguiProvider config={tamaguiConfig}>
      <Stack>
        <Stack.Screen
          name='(tabs)'
          options={{ headerShown: false }}
        />
        <Stack.Screen
          name='diets/new-diet'
          options={{ headerShown: true, headerTitle: 'Cadastrar Dieta' }}
        />
      </Stack>
    </TamaguiProvider>
  );
}
