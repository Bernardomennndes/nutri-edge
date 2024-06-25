import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nutri_edge/components/meals_card.dart';
import 'package:nutri_edge/controllers/diet_details_controller.dart';
import 'package:nutri_edge/controllers/diets_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/constants.dart';

class DietDetails extends StatelessWidget {
  const DietDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final temporaryDietSrc = DietDetailsController.to.diet.value.imageSrc.obs;
    final carouselPosition =
        DIET_LOGOS.indexOf(DietDetailsController.to.diet.value.imageSrc!).obs;

    void onSubmit() {
      DietDetailsController.to.diet.value.imageSrc = temporaryDietSrc.value;
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/diets',
        (Route<dynamic> route) => false,
      );
    }

    return Layout(
      title: "Detalhes",
      appBarActions: [
        IconButton(
          onPressed: () => onSubmit(),
          icon: const Icon(
            LineIcons.check,
            color: COLOR_PRIMARY,
          ),
        ),
      ],
      showNavbar: false,
      child: GetBuilder<DietDetailsController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(temporaryDietSrc.value!),
                      child: IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 1.0,
                                      enlargeCenterPage: true,
                                      initialPage: DIET_LOGOS.indexOf(
                                        temporaryDietSrc.value!,
                                      ),
                                      onPageChanged: (index, _) {
                                        carouselPosition.value = index;
                                      },
                                    ),
                                    items: DIET_LOGOS
                                        .map(
                                          (item) => Container(
                                            margin: const EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                              child: Image.asset(
                                                item,
                                                fit: BoxFit.cover,
                                                width: 1000.0,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            temporaryDietSrc.value = DIET_LOGOS[
                                                carouselPosition.value];
                                            Navigator.pop(context);
                                          },
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              COLOR_SECONDARY,
                                            ),
                                          ),
                                          child: const Text(
                                            'Escolher',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.diet.value.name!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final selectedDiet =
                              DietDetailsController.to.diet.value;
                          DietsController.to.deleteDiet(selectedDiet);
                          Navigator.pop(context);
                        },
                        icon: const Icon(LineIcons.trash),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        controller.diet.value.description!,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${controller.diet.value.meals!.length} Refeições"),
                      Text(
                        "${controller.diet.value.totalCalories} Kcal",
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Refeições",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    for (var meal in controller.diet.value.meals!)
                      MealsCard(meal: meal),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
