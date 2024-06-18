import { View } from 'react-native';

import { Avatar, Input, Label } from 'tamagui';

export default function Tab() {
  return (
    <View className='flex p-4 h-screen'>
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
        <View>
          <Label fontWeight='$16'>Nome</Label>
          <Input />
        </View>
      </View>
    </View>
  );
}
