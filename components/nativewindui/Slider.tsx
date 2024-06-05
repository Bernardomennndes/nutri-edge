import { Platform } from 'react-native';

import RNSlider from '@react-native-community/slider';
import { useColorScheme } from '~/lib/useColorScheme';
import { COLORS } from '~/theme/colors';

export function Slider({
  maximumTrackTintColor,
  minimumTrackTintColor,
  thumbTintColor,
  ...props
}: React.ComponentPropsWithoutRef<typeof RNSlider>) {
  const { colors } = useColorScheme();
  return (
    <RNSlider
      maximumTrackTintColor={
        maximumTrackTintColor ?? Platform.OS === 'android'
          ? colors.primary
          : undefined
      }
      minimumTrackTintColor={minimumTrackTintColor ?? colors.primary}
      thumbTintColor={
        thumbTintColor ?? Platform.OS === 'ios' ? COLORS.white : colors.primary
      }
      {...props}
    />
  );
}
