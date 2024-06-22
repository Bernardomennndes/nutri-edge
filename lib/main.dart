import 'package:flutter/material.dart';
import 'package:nutri_edge/screens/diet_details.dart';
import 'package:nutri_edge/screens/diets.dart';
import 'package:nutri_edge/screens/edit_profile.dart';
import 'package:nutri_edge/screens/home.dart';
import 'package:nutri_edge/screens/new_diet/new_diet_alergies.dart';
import 'package:nutri_edge/screens/new_diet/new_diet_objective.dart';
import 'package:nutri_edge/screens/new_diet/new_diet_intolerance.dart';
import 'package:nutri_edge/screens/profile.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => const Home(),
        '/diets': (context) => const Diets(),
        '/newDietStepOne': (context) => const NewDietObjective(),
        '/newDietStepTwo': (context) => const NewDietIntolerance(),
        '/newDietStepThree': (context) => const NewDietAlergies(),
        '/dietDetails': (context) => const DietDetails(),
        '/profile': (context) => const Profile(),
        '/editProfile': (context) => const EditProfile(),
      },
    );
  }
}
