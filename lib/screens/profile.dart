import 'package:flutter/material.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Perfil",
      appBarActions: [
        SizedBox(
          width: 45,
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/editProfile'),
            style: const ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 212, 212, 212))
            ), 
            child: const Icon(
              Icons.edit,
              color: Colors.black,  
            ),
          ),
        )
      ],
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: COLOR_PRIMARY,
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
                              Text(
                                "Nome",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Luiz Henrique Almeida Gomes",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          )
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
                              Text(
                                "Idade",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "21 anos",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          )
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
                              Text(
                                "Peso",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "65 kg",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 80,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Altura",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "165 cm",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
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
                              Text(
                                "Sexo",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Masculino",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          )
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
                              Text(
                                "Tx. de Metabolismo Basal",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "2700 Kcal",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}