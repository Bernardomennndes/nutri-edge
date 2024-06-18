import { View } from 'react-native';

import { Text } from '~/components/nativewindui/Text';

export default function Tab() {
  return (
    <View className='container flex justify-center p-4'>
      <Text className='font-bold'>
        Aplicativo gerador de dietas a partir do uso de Inteligência Artificial.
      </Text>
    </View>
  );
}
