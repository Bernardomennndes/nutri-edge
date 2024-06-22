import 'package:flutter/material.dart';
import 'package:nutri_edge/layout/layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "NutriEdge",
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/nutri-edge-icon.png'),
            const Text(
              "Um aplicativo de nutrição criado para facilitar a vida das pessoas, " 
              "utilizando da inteligência artificial para gerar suas dietas e refeições.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ), 
    );
  }
}