import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nutri_edge/components/meals_card.dart';
import 'package:nutri_edge/controllers/diets_controller.dart';
import 'package:nutri_edge/controllers/new_diet_controller.dart';
import 'package:nutri_edge/controllers/profile_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/models/diet.dart';
import 'package:nutri_edge/service/gpt_api.dart';
import 'package:nutri_edge/style/constants.dart';

class NewDietConfirm extends StatefulWidget {
  const NewDietConfirm({super.key});

  @override
  State<NewDietConfirm> createState() => _NewDietConfirmState();
}

class _NewDietConfirmState extends State<NewDietConfirm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  var newDiet = Diet().obs;

  @override
  void initState() {
    super.initState();
  }

  void _onSubmit() {
    if (_nameController.text != '') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/diets',
        (Route<dynamic> route) => false,
      );
      newDiet.value.name = _nameController.text;
      newDiet.value.description = _descriptionController.text;
      DietsController.to.addDiet(newDiet.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Diet>(
      future: GptApi.request(
        selectedObjective: NewDietController.to.selectedObjective.value,
        selectedIntolerances: NewDietController.to.selectedIntolerances,
        alergies: NewDietController.to.alergies,
        profileMetrics: ProfileController.to.profile.value,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Layout(
            showNavbar: false,
            child: Center(
              child: CircularProgressIndicator(
                color: COLOR_PRIMARY,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Layout(
            showNavbar: false,
            child: Center(
              child: Text(
                'Ocorreu um erro ao gerar sua dieta. Tente novamente.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          newDiet.value = snapshot.data!;
          return Layout(
            title: "Nova Dieta",
            appBarActions: [
              IconButton(
                onPressed: () => _onSubmit(),
                icon: const Icon(
                  LineIcons.check,
                  color: COLOR_PRIMARY,
                ),
              ),
            ],
            showNavbar: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          'assets/diet-logos/cbum.png',
                        ),
                        child: IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                width: 600,
                                height: 400,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          color: Colors.white,
                          icon: const Icon(
                            LineIcons.pen,
                            color: Colors.white,
                            size: 40,
                            shadows: [
                              Shadow(
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Descrição',
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${snapshot.data!.meals!.length} Refeições"),
                          Text(
                            "${snapshot.data!.totalCalories} Kcal",
                            style: const TextStyle(
                              color: COLOR_SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Refeições",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  for (var meal in snapshot.data!.meals!) MealsCard(meal: meal)
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Nenhum aeroporto encontrado.'),
          );
        }
      },
    );
  }
}
