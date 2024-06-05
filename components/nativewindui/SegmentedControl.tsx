import { Platform } from 'react-native';

import RNSegmentedControl from '@react-native-segmented-control/segmented-control';
import { useColorScheme } from '~/lib/useColorScheme';

export function SegmentedControl(
  props: React.ComponentPropsWithoutRef<typeof RNSegmentedControl>,
) {
  const { colors, colorScheme } = useColorScheme();
  return (
    <RNSegmentedControl
      backgroundColor={
        Platform.OS === 'android'
          ? colorScheme === 'dark'
            ? colors.background
            : colors.grey6
          : undefined
      }
      {...props}
    />
  );
}
