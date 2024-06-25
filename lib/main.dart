// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/controllers/diet_details_controller.dart';
import 'package:nutri_edge/controllers/diets_controller.dart';
import 'package:nutri_edge/controllers/profile_controller.dart';
import 'package:nutri_edge/screens/diet_details.dart';
import 'package:nutri_edge/screens/diets.dart';
import 'package:nutri_edge/screens/edit_profile.dart';
import 'package:nutri_edge/screens/home.dart';
import 'package:nutri_edge/screens/new_diet/new_diet_alergies.dart';
import 'package:nutri_edge/screens/new_diet/new_diet_confirm.dart';
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
    final ProfileController profileController = Get.put(ProfileController());
    final DietsController dietsController = Get.put(DietsController());
    final DietDetailsController dietDetailsController = Get.put(
      DietDetailsController(),
    );
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
        '/newDietConfirm': (context) => const NewDietConfirm(),
        '/dietDetails': (context) => const DietDetails(),
        '/profile': (context) => const Profile(),
        '/editProfile': (context) => const EditProfile(),
      },
    );
  }
}
