import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/components/diet_card.dart';
import 'package:nutri_edge/controllers/diets_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/constants.dart';

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
      child: GetBuilder<DietsController>(builder: (controller) {
        if (controller.diets.isEmpty) {
          return const Center(
            child: Text("Nenhuma dieta cadastrada."),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              for (var diet in controller.diets)
                DietCard(
                  diet: diet,
                )
            ],
          ),
        );
      }),
    );
  }
}
