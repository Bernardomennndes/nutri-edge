import * as React from 'react';
import { View } from 'react-native';
import Animated, {
  Extrapolation,
  interpolate,
  useAnimatedStyle,
  useDerivedValue,
  withSpring,
} from 'react-native-reanimated';

import { cn } from '~/lib/cn';

const DEFAULT_MAX = 100;

const ProgressIndicator = React.forwardRef<
  React.ElementRef<typeof View>,
  {
    getValueLabel?: (value: number, max: number) => string;
    max?: number;
    value?: number;
  } & React.ComponentPropsWithoutRef<typeof View>
>(
  (
    {
      children,
      className,
      getValueLabel = defaultGetValueLabel,
      max: maxProp,
      value: valueProp,
      ...props
    },
    ref,
  ) => {
    const max = maxProp ?? DEFAULT_MAX;
    const value = isValidValueNumber(valueProp, max) ? valueProp : 0;
    const progress = useDerivedValue(() => value ?? 0);

    const indicator = useAnimatedStyle(() => {
      return {
        width: withSpring(
          `${interpolate(
            progress.value,
            [0, 100],
            [1, 100],
            Extrapolation.CLAMP,
          )}%`,
          { overshootClamping: true },
        ),
      };
    });

    return (
      <View
        accessibilityValue={{
          max,
          min: 0,
          now: value,
          text: getValueLabel(value, max),
        }}
        aria-valuemax={max}
        aria-valuemin={0}
        aria-valuenow={value}
        aria-valuetext={getValueLabel(value, max)}
        className={cn(
          'relative h-1 w-full overflow-hidden rounded-full',
          className,
        )}
        ref={ref}
        role='progressbar'
        {...props}
      >
        <View className='absolute left-0 top-0 right-0 bottom-0 bg-muted opacity-20' />
        <Animated.View
          className={cn('h-full bg-primary')}
          role='presentation'
          style={indicator}
        />
      </View>
    );
  },
);

ProgressIndicator.displayName = 'ProgressIndicator';

export { ProgressIndicator };

function defaultGetValueLabel(value: number, max: number) {
  return `${Math.round((value / max) * 100)}%`;
}

function isValidValueNumber(value: any, max: number): value is number {
  return (
    typeof value === 'number' && !isNaN(value) && value <= max && value >= 0
  );
}
