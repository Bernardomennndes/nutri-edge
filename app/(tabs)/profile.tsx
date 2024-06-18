import { View, Text } from 'react-native';

import { Avatar } from 'tamagui';

export default function Tab() {
  return (
    <View className='flex p-4 flex-1'>
      <View className='flex items-center'>
        <Avatar
          circular
          size='$14'
        >
          <Avatar.Image
            accessibilityLabel='Cam'
            src='https://images.unsplash.com/photo-1548142813-c348350df52b?&w=150&h=150&dpr=2&q=80'
          />
        </Avatar>
      </View>
      <View className='flex justify-evenly flex-1 items-start'>
        <View className='flex flex-1 w-full'>
          <Text className='font-bold'>Nome</Text>
          <Text className='font-light text-sm'>
            Luiz Henrique Almeida Gomes
          </Text>
        </View>
        <View className='flex flex-1 w-full'>
          <Text className='font-bold'>Idade</Text>
          <Text className='font-light text-sm'>21 anos</Text>
        </View>
        <View className='flex flex-row flex-1'>
          <View className='flex flex-1'>
            <Text className='font-bold'>Peso</Text>
            <Text className='font-light text-sm'>65 kg</Text>
          </View>
          <View className='flex flex-1'>
            <Text className='font-bold'>Altura</Text>
            <Text className='font-light text-sm'>165 cm</Text>
          </View>
        </View>
        <View className='flex flex-1 w-full'>
          <Text className='font-bold'>Sexo</Text>
          <Text className='font-light text-sm'>Masculino</Text>
        </View>
        <View className='flex flex-1 w-full'>
          <Text className='font-bold'>Objetivo</Text>
          <Text className='font-light text-sm'>Emagrecimento e Saúde</Text>
        </View>
        <View className='flex flex-1 w-full'>
          <Text className='font-bold'>Tx. de Metabolismo Basal</Text>
          <Text className='font-light text-sm'>2700 Kcal</Text>
        </View>
      </View>
    </View>
  );
}
