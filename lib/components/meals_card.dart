import 'package:flutter/material.dart';
import 'package:nutri_edge/models/meal.dart';
import 'package:nutri_edge/style/constants.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 199, 199, 199),
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
            blurRadius: 5,
            offset: Offset(2, 1.6),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${meal.calories} Kcal",
                    style: const TextStyle(
                      fontSize: 16,
                      color: COLOR_THIRD,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              for (var food in meal.foods)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${food.name} ${food.quantity} ${food.unitMeasurement}",
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '${food.calories} Kcal',
                      style: const TextStyle(color: Colors.green),
                    )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
