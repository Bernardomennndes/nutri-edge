import { Pressable, View } from 'react-native';
import Animated, {
  LayoutAnimationConfig,
  ZoomInRotate,
} from 'react-native-reanimated';

import { Icon } from '@roninoss/icons';
import { cn } from '~/lib/cn';
import { useColorScheme } from '~/lib/useColorScheme';
import { COLORS } from '~/theme/colors';

export function ThemeToggle() {
  const { colorScheme, toggleColorScheme } = useColorScheme();
  return (
    <LayoutAnimationConfig skipEntering>
      <Animated.View
        className='items-center justify-center'
        entering={ZoomInRotate}
        key={`toggle-${colorScheme}`}
      >
        <Pressable
          className='opacity-80'
          onPress={toggleColorScheme}
        >
          {colorScheme === 'dark'
            ? ({ pressed }) => (
                <View className={cn('px-0.5', pressed && 'opacity-50')}>
                  <Icon
                    color={COLORS.white}
                    name='moon.stars'
                    namingScheme='sfSymbol'
                  />
                </View>
              )
            : ({ pressed }) => (
                <View className={cn('px-0.5', pressed && 'opacity-50')}>
                  <Icon
                    color={COLORS.black}
                    name='sun.min'
                    namingScheme='sfSymbol'
                  />
                </View>
              )}
        </Pressable>
      </Animated.View>
    </LayoutAnimationConfig>
  );
}
