import type { CardProps } from 'tamagui';

import React from 'react';
import { Text, View } from 'react-native';

import { Diet } from '~/types/diet';
import { Avatar, Card } from 'tamagui';

interface DietCardProps extends CardProps {
  diet: Diet;
}

const DietCard = ({ diet, ...props }: DietCardProps) => {
  return (
    <Card
      bordered
      elevate
      size='$4'
      {...props}
    >
      <Card.Header padded>
        <View className='flex flex-row gap-2'>
          <Avatar
            circular
            size='$6'
          >
            <Avatar.Image
              accessibilityLabel='Cam'
              src='https://images.unsplash.com/photo-1548142813-c348350df52b?&w=150&h=150&dpr=2&q=80'
            />
          </Avatar>
          <View className='flex flex-1 flex-col justify-between'>
            <Text className='font-bold'>{diet.name}</Text>
            <Text className='font-light whitespace-normal'>
              {diet.description}
            </Text>
            <View className='flex flex-row justify-between items-stretch'>
              <Text>{diet.mealsQuantity} Refeições</Text>
              <Text>{diet.totalCalories} Kcal</Text>
            </View>
          </View>
        </View>
      </Card.Header>
      <Card.Footer />
      <Card.Background />
    </Card>
  );
};

export default DietCard;
