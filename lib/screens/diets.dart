import 'package:flutter/material.dart';
import 'package:nutri_edge/components/diet_card.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/colors.dart';

class Diets extends StatelessWidget {
  const Diets({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Dietas",
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/newDietStepOne'),
        backgroundColor: COLOR_PRIMARY,
        child: const Icon(
          Icons.add, 
          color: Colors.white,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DietCard(),
            DietCard(),
          ],
        ),
      ),
    );
  }
}