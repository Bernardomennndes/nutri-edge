import { View, ScrollView } from 'react-native';

import DietCard from '~/components/diet/DietCard';
import { Plus } from 'lucide-react-native';
import { Button } from 'tamagui';

const cards = [
  {
    description: 'Dieta focada em ganho de massa',
    id: 1,
    mealsQuantity: 8,
    name: 'Bulking',
    totalCalories: 3200,
  },
  {
    description: 'Dieta focada em secar',
    id: 2,
    mealsQuantity: 6,
    name: 'Cutting',
    totalCalories: 2000,
  },
  {
    description: 'Dieta para manter o peso estável',
    id: 3,
    mealsQuantity: 5,
    name: 'Manter Peso',
    totalCalories: 2300,
  },
];

export default function Tab() {
  return (
    <View className='h-screen relative'>
      <Button
        bottom='$15'
        position='absolute'
        right='$5'
        theme='green_active'
        zIndex='$5'
      >
        <Plus />
      </Button>
      <ScrollView>
        <View className='flex flex-col p-4 gap-2'>
          {cards.map((diet) => (
            <DietCard
              animation='bouncy'
              diet={diet}
              hoverStyle={{ scale: 0.925 }}
              key={diet.id}
              pressStyle={{ scale: 0.875 }}
            />
          ))}
        </View>
      </ScrollView>
    </View>
  );
}
