import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';
import 'package:nutri_edge/controllers/diet_details_controller.dart';
import 'package:nutri_edge/models/diet.dart';
import 'package:nutri_edge/style/constants.dart';
import 'package:bounce_tap/bounce_tap.dart';

class DietCard extends StatelessWidget {
  const DietCard({super.key, required this.diet});
  final Diet diet;

  @override
  Widget build(BuildContext context) {
    return BounceTap(
      duration: const Duration(milliseconds: 150),
      tapIntensity: TapIntensity.weak,
      tapDelay: 50,
      onTap: () {
        DietDetailsController.to.diet.value = diet;
        Navigator.pushNamed(context, '/dietDetails');
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
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
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(diet.imageSrc!),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        diet.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        diet.description!,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${diet.meals!.length} Refeições"),
                      Text(
                        "${diet.totalCalories} Kcal",
                        style: const TextStyle(
                          color: COLOR_SECONDARY,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
