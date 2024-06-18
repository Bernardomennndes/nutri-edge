import { Tabs } from 'expo-router';
import { Home, NotepadText, UserRound } from 'lucide-react-native';

import '../../global.css';

export default function TabLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: 'green' }}>
      <Tabs.Screen
        name='index'
        options={{
          headerTitle: 'NutriEdge',
          tabBarIcon: ({ color }) => <Home color={color} />,
          title: 'Home',
        }}
      />
      <Tabs.Screen
        name='diets'
        options={{
          tabBarIcon: ({ color }) => <NotepadText color={color} />,
          title: 'Dietas',
        }}
      />
      <Tabs.Screen
        name='profile'
        options={{
          tabBarIcon: ({ color }) => <UserRound color={color} />,
          title: 'Perfil',
        }}
      />
    </Tabs>
  );
}
