import * as React from 'react';
import { Platform } from 'react-native';

import { COLORS } from '~/theme/colors';
import * as NavigationBar from 'expo-navigation-bar';
import { useColorScheme as useNativewindColorScheme } from 'nativewind';

function useColorScheme() {
  const { colorScheme, setColorScheme: setNativeWindColorScheme } =
    useNativewindColorScheme();

  async function setColorScheme(colorScheme: 'dark' | 'light') {
    setNativeWindColorScheme(colorScheme);
    if (Platform.OS !== 'android') return;
    try {
      await setNavigationBar(colorScheme);
    } catch (error) {
      console.error('useColorScheme.tsx", "setColorScheme', error);
    }
  }

  function toggleColorScheme() {
    return setColorScheme(colorScheme === 'light' ? 'dark' : 'light');
  }

  return {
    colors: COLORS[colorScheme ?? 'light'],
    colorScheme: colorScheme ?? 'light',
    isDarkColorScheme: colorScheme === 'dark',
    setColorScheme,
    toggleColorScheme,
  };
}

/**
 * Set the Android navigation bar color based on the color scheme.
 */
function useInitialAndroidBarSync() {
  const { colorScheme } = useColorScheme();
  React.useEffect(() => {
    if (Platform.OS !== 'android') return;
    setNavigationBar(colorScheme).catch((error) => {
      console.error('useColorScheme.tsx", "useInitialColorScheme', error);
    });
  }, []);
}

export { useColorScheme, useInitialAndroidBarSync };

function setNavigationBar(colorScheme: 'dark' | 'light') {
  return Promise.all([
    NavigationBar.setButtonStyleAsync(
      colorScheme === 'dark' ? 'light' : 'dark',
    ),
    NavigationBar.setPositionAsync('absolute'),
    NavigationBar.setBackgroundColorAsync(
      colorScheme === 'dark' ? '#00000080' : '#ffffff80',
    ),
  ]);
}
