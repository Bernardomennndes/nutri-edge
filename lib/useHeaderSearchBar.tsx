import * as React from 'react';
import { SearchBarProps } from 'react-native-screens';

import { COLORS } from '~/theme/colors';
import { useNavigation } from 'expo-router';

import { useColorScheme } from './useColorScheme';

export function useHeaderSearchBar(props: SearchBarProps = {}) {
  const { colors, colorScheme } = useColorScheme();
  const navigation = useNavigation();
  const [search, setSearch] = React.useState('');

  React.useLayoutEffect(() => {
    navigation.setOptions({
      headerSearchBarOptions: {
        barTintColor: colorScheme === 'dark' ? COLORS.black : COLORS.white,
        headerIconColor: colors.foreground,
        hideWhenScrolling: false,
        hintTextColor: colors.grey,
        onChangeText(ev) {
          setSearch(ev.nativeEvent.text);
        },
        placeholder: 'Search...',
        textColor: colors.foreground,
        tintColor: colors.primary,
        ...props,
      } satisfies SearchBarProps,
    });
  }, [navigation, colorScheme]);

  return search;
}
