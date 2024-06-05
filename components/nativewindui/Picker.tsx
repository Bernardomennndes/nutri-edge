import { View } from 'react-native';

import { Picker as RNPicker } from '@react-native-picker/picker';
import { cn } from '~/lib/cn';
import { useColorScheme } from '~/lib/useColorScheme';

export function Picker<T>({
  className,
  dropdownIconColor,
  dropdownIconRippleColor,
  mode = 'dropdown',
  style,
  ...props
}: React.ComponentPropsWithoutRef<typeof RNPicker<T>>) {
  const { colors } = useColorScheme();
  return (
    <View
      className={cn(
        'bg-background border border-background ios:shadow-sm ios:shadow-black/5 rounded-md',
        className,
      )}
    >
      <RNPicker
        dropdownIconColor={dropdownIconColor ?? colors.foreground}
        dropdownIconRippleColor={dropdownIconRippleColor ?? colors.foreground}
        mode={mode}
        style={
          style ?? {
            backgroundColor: colors.root,
            borderRadius: 8,
          }
        }
        {...props}
      />
    </View>
  );
}

export const PickerItem = RNPicker.Item;
