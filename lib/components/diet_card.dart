import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';
import 'package:nutri_edge/style/colors.dart';
import 'package:bounce_tap/bounce_tap.dart';

class DietCard extends StatelessWidget {
  const DietCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BounceTap(
        duration: const Duration(milliseconds: 150),
        tapIntensity: TapIntensity.weak,
        tapDelay: 50,
        onTap: () => Navigator.pushNamed(context, '/dietDetails'),
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
                offset: Offset(2, 1.6)
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: COLOR_PRIMARY,
                  )
                ],
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Bulking", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 16),
                          )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Dieta Focada em Ganho de Massa", style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("6 Refeições"),
                        Text(
                          "3200 Kcal", 
                          style: TextStyle(
                            color: COLOR_SECONDARY,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),
            ],
          ),
        ),
    );
  }
}