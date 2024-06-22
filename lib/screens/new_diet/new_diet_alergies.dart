import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/colors.dart';
import 'package:line_icons/line_icons.dart';

class NewDietAlergies extends StatelessWidget {
  const NewDietAlergies({super.key});

  @override
  Widget build(BuildContext context) {
    final alergies = <String>[].obs;
    TextEditingController inputController = TextEditingController();
    return Layout(
      showNavbar: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 150,
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
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5),
              child: Text(
                "Possui alguma alergia?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: Text(
                "Adicione os alimentos que você tem alergia.", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700]
                ),
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
                        borderSide: BorderSide(
                          color: COLOR_PRIMARY
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26
                        )
                      ),
                      isDense: true
                    ),
                  )
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () { 
                    if(inputController.text != ''){
                      alergies.add(inputController.text);
                    }
                    inputController.text = '';
                  }, 
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ))
                  ),
                  icon: const Icon(
                    LineIcons.plus, 
                    color: Colors.white,
                  ), 
                )
              ],
            ),
            const SizedBox(height: 12),
            Obx(() => SingleChildScrollView(
              child: ListView.builder(
                  itemCount: alergies.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 4, left: 10, right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: const BoxDecoration(
                        color: COLOR_THIRD,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              alergies[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => alergies.removeAt(index),
                            icon: const Icon(
                              LineIcons.trash, 
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
            ),
            ),
          ]
        ),
      ),
    );
  }
}