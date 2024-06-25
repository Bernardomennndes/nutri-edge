import 'package:flutter/material.dart';
import 'package:nutri_edge/controllers/profile_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/utils/utils.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ProfileController.to.profile.value;
    return Layout(
      title: "Perfil",
      appBarActions: [
        SizedBox(
          width: 45,
          child: TextButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/editProfile',
            ),
            style: const ButtonStyle(
              overlayColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 212, 212, 212),
              ),
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(profile.avatarSrc),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nome",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                profile.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Idade",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${profile.age}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Peso",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${profile.weight} kg',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Altura",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${profile.height} cm',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sexo",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                profile.gender,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Tx. de Metabolismo Basal",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${Utils.basalMetabolicRateCalc(profile)} Kcal',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
