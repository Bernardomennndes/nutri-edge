import { useState } from 'react';
import { View } from 'react-native';

import { Text } from '~/components/nativewindui/Text';
import { Button } from 'tamagui';

export default function Tab() {
  const [count, setCount] = useState<number>(0);
  return (
    <View className='container flex justify-center p-4'>
      <Text className='font-bold'>Index</Text>
      <Text className='text-sm text-black'>{count}</Text>
      <Button
        onPress={() => setCount((prevCount) => prevCount + 1)}
        theme='green_active'
      >
        Increment
      </Button>
    </View>
  );
}
