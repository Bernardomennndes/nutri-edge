import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/controllers/new_diet_controller.dart';
import 'package:nutri_edge/controllers/profile_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/service/gpt_api.dart';
import 'package:nutri_edge/style/constants.dart';
import 'package:line_icons/line_icons.dart';

class NewDietAlergies extends StatelessWidget {
  const NewDietAlergies({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
    return Layout(
      showNavbar: false,
      child: GetBuilder<NewDietController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 5),
                child: Text(
                  "Possui alguma alergia?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                child: Text(
                  "Adicione os alimentos que você tem alergia.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: COLOR_PRIMARY),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {
                      if (inputController.text != '') {
                        controller.alergies.add(inputController.text);
                      }
                      inputController.text = '';
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    icon: const Icon(
                      LineIcons.plus,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        children: [
                          for (var index = 0;
                              index < controller.alergies.length;
                              index++)
                            Obx(
                              () => Container(
                                margin: const EdgeInsets.only(
                                  bottom: 4,
                                  left: 10,
                                  right: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                decoration: const BoxDecoration(
                                  color: COLOR_THIRD,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.alergies[index],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          controller.alergies.removeAt(index),
                                      icon: const Icon(
                                        LineIcons.trash,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/newDietConfirm');
                  // GptApi.request(
                  //   selectedObjective: controller.selectedObjective.value,
                  //   selectedIntolerances: controller.selectedIntolerances,
                  //   alergies: controller.alergies,
                  //   profileMetrics: ProfileController.to.profile.value,
                  // );
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
                ),
                child: const Text(
                  "Gerar Dieta",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
