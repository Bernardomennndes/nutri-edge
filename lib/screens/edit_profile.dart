import 'package:flutter/material.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return  Layout(
      title: "Alterar Perfil",
      showNavbar: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: COLOR_PRIMARY,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              cursorColor: COLOR_PRIMARY,
                              style: TextStyle(
                                fontWeight: FontWeight.w300
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Nome",
                                label: Text(
                                  "Nome", 
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: COLOR_PRIMARY
                                  )
                                )
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              cursorColor: COLOR_PRIMARY,
                              style: TextStyle(
                                fontWeight: FontWeight.w300
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Idade",
                                label: Text(
                                  "Idade", 
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: COLOR_PRIMARY
                                  )
                                )
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                            child: TextField(
                              cursorColor: COLOR_PRIMARY,
                              style: TextStyle(
                                fontWeight: FontWeight.w300
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                suffix: Text("kg"),
                                border: OutlineInputBorder(),
                                label: Text(
                                  "Peso", 
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: COLOR_PRIMARY
                                  )
                                )
                              ),
                            ),
                          ),
                          SizedBox(width: 80),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                child: TextField(
                                  cursorColor: COLOR_PRIMARY,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffix: Text("cm"),
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    label: Text(
                                      "Altura", 
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: COLOR_PRIMARY
                                      )
                                    )
                                  ),
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
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: DropdownButton<String>(
                                  isDense: true,
                                  value: 'Masculino',
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  iconEnabledColor: COLOR_PRIMARY,
                                  onChanged: (value){},
                                  items: <String>['Masculino', 'Feminino'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: TextButton(
                      onPressed: () {}, 
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
                      ),
                      child: const Text(
                        "Salvar", 
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}