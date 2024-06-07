import FontAwesome from '@expo/vector-icons/FontAwesome';
import { Tabs } from 'expo-router';

import '../../global.css';

export default function TabLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: 'green' }}>
      <Tabs.Screen
        name='index'
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome
              color={color}
              name='home'
              size={28}
            />
          ),
          title: 'Home',
        }}
      />
      <Tabs.Screen
        name='diets'
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome
              color={color}
              name='list'
              size={18}
            />
          ),
          title: 'Dietas',
        }}
      />
      <Tabs.Screen
        name='teste'
        options={{
          tabBarIcon: ({ color }) => (
            <FontAwesome
              color={color}
              name='filter'
              size={28}
            />
          ),
          title: 'Teste',
        }}
      />
    </Tabs>
  );
}
