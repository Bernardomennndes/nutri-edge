import 'package:bounce_tap/bounce_tap.dart';
import 'package:bounce_tap/tap_intensity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/components/generic_card.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/models/objectives.dart';
import 'package:nutri_edge/style/colors.dart';

class NewDietObjective extends StatelessWidget {
  const NewDietObjective({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedObjective = Objectives.health.obs;
    return Layout(
      showNavbar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 5),
            child: Text(
              "Qual o seu objetivo?",
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
              "Selecione uma das opções abaixo que se encaixa melhor no seu objetivo.", 
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
                    onTap: () => selectedObjective.value = Objectives.cutting,
                    child: GenericCard(
                      isSelected: selectedObjective.value == Objectives.cutting, 
                      text: "Emagrecimento", 
                      iconSrc: 'assets/lose-weight-icon.png'
                    ), 
                  ),
                ),
                Obx(() => BounceTap(
                    duration: const Duration(milliseconds: 100),
                    tapDelay: 0,
                    tapIntensity: TapIntensity.weak,
                    onTap: () => selectedObjective.value = Objectives.health,
                    child: GenericCard(
                      isSelected: selectedObjective.value == Objectives.health, 
                      text: "Saúde", 
                      iconSrc: 'assets/healthy-icon.png'
                    ), 
                  ),
                ),
                Obx(() => BounceTap(
                    duration: const Duration(milliseconds: 100),
                    tapDelay: 0,
                    tapIntensity: TapIntensity.weak,
                    onTap: () => selectedObjective.value = Objectives.strength,
                    child: GenericCard(
                      isSelected: selectedObjective.value == Objectives.strength, 
                      text: "Força", 
                      iconSrc: 'assets/muscle-icon.png'
                    ), 
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/newDietStepTwo'),
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