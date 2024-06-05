import * as React from 'react';
import { Pressable, View } from 'react-native';

import DateTimePicker, {
  DateTimePickerAndroid,
} from '@react-native-community/datetimepicker';
import { Text } from '~/components/nativewindui/Text';

export function DatePicker(
  props: {
    mode: 'date' | 'datetime' | 'time';
  } & React.ComponentProps<typeof DateTimePicker>,
) {
  const show = (currentMode: 'date' | 'time') => () => {
    DateTimePickerAndroid.open({
      maximumDate: props.maximumDate,
      minimumDate: props.minimumDate,
      mode: currentMode,
      onChange: props.onChange,
      value: props.value,
    });
  };

  return (
    <View className='flex-row gap-2.5'>
      {props.mode.includes('date') && (
        <View className='relative pt-1.5'>
          <Pressable
            className='border border-border active:opacity-80 px-5 py-3 rounded-md'
            onPress={show('date')}
          >
            <Text variant='subhead'>
              {new Intl.DateTimeFormat('en-US', {
                dateStyle: 'medium',
              }).format(props.value)}
            </Text>
          </Pressable>
          <View className='absolute top-0 left-2 bg-card px-1'>
            <Text
              className='text-[10px] opacity-60'
              variant='caption2'
            >
              Date
            </Text>
          </View>
        </View>
      )}
      {props.mode.includes('time') && (
        <View className='relative pt-1.5'>
          <Pressable
            className='border border-border active:opacity-80 px-5 py-3 rounded-md'
            onPress={show('time')}
          >
            <Text variant='subhead'>
              {new Intl.DateTimeFormat('en-US', {
                timeStyle: 'short',
              }).format(props.value)}
            </Text>
          </Pressable>
          <View className='absolute top-0 left-2 bg-card px-1'>
            <Text
              className='text-[10px] opacity-60'
              variant='caption2'
            >
              Time
            </Text>
          </View>
        </View>
      )}
    </View>
  );
}
