import { View } from 'react-native';

import { Text } from '~/components/nativewindui/Text';

export default function Tab() {
  return (
    <View className='container flex justify-evenly p-4 h-screen'>
      <Text className='text-black'>
        Aplicativo gerador de dietas a partir do uso de Inteligência Artificial.
      </Text>
      <Text className='text-black font-light text-sm'>
        Feito por Bernardo e Luiz Henrique.
      </Text>
    </View>
  );
}
