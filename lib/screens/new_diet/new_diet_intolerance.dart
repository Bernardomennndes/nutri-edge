import 'package:bounce_tap/bounce_tap.dart';
import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/components/generic_card.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/models/intolerances.dart';
import 'package:nutri_edge/style/colors.dart';

class NewDietIntolerance extends StatelessWidget {
  const NewDietIntolerance({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIntolerances = <Intolerances, bool>{ Intolerances.gluten: false, Intolerances.milk : false }.obs;
    return Layout(
      showNavbar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5),
            child: Text(
              "Possui alguma intolerância?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Selecione as opções abaixo que você possui intolerância.", 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700]
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => BounceTap(
                    duration: const Duration(milliseconds: 100),
                    tapDelay: 0,
                    tapIntensity: TapIntensity.weak,
                    onTap: () => selectedIntolerances[Intolerances.milk] = !selectedIntolerances[Intolerances.milk]!,
                    child: GenericCard(
                      isSelected: selectedIntolerances[Intolerances.milk]!, 
                      text: "Leite", 
                      iconSrc: 'assets/glass-of-milk-icon.png'
                    ), 
                  ),
                ),
                Obx(() => BounceTap(
                    duration: const Duration(milliseconds: 100),
                    tapDelay: 0,
                    tapIntensity: TapIntensity.weak,
                    onTap: () => selectedIntolerances[Intolerances.gluten] = !selectedIntolerances[Intolerances.gluten]!,
                    child: GenericCard(
                      isSelected: selectedIntolerances[Intolerances.gluten]!, 
                      text: "Glúten", 
                      iconSrc: 'assets/gluten.png'
                    ), 
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/newDietStepThree'),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
              ),
              child: const Text(
                "Próximo",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}