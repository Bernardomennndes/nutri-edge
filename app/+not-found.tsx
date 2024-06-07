import { View } from 'react-native';

import { Text } from '~/components/nativewindui/Text';
import { Link, Stack } from 'expo-router';

export default function NotFoundScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'Oops!' }} />
      <View className='flex-1 items-center justify-center bg-background p-5'>
        <Text variant='largeTitle'>This screen doesn&apos;t exist.</Text>
        <Link
          className='m-4 py-4'
          href='/'
        >
          <Text>Go to home screen!</Text>
        </Link>
      </View>
    </>
  );
}
