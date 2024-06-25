import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nutri_edge/controllers/profile_controller.dart';
import 'package:nutri_edge/layout/layout.dart';
import 'package:nutri_edge/style/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  var sex = ProfileController.to.profile.value.gender;
  var profile = ProfileController.to.profile.value;

  @override
  void initState() {
    _nameController.text = profile.name;
    _ageController.text = profile.age.toString();
    _heightController.text = profile.height.toString();
    _weightController.text = profile.weight.toString();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final temporaryAvatarSrc = profile.avatarSrc.obs;
    final carouselPosition = AVATAR_LOGOS.indexOf(profile.avatarSrc).obs;

    void onSubmit() {
      ProfileController.to.updateFields(
        name: _nameController.text,
        age: int.parse(_ageController.text),
        height: int.parse(_heightController.text),
        weight: double.parse(_weightController.text),
        sex: sex,
        avatarSrc: temporaryAvatarSrc.value,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/profile',
        (Route<dynamic> route) => false,
      );
    }

    return Layout(
      title: "Alterar Perfil",
      showNavbar: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  temporaryAvatarSrc.value,
                ),
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                aspectRatio: 1.0,
                                enlargeCenterPage: true,
                                initialPage: AVATAR_LOGOS.indexOf(
                                  temporaryAvatarSrc.value,
                                ),
                                onPageChanged: (index, _) {
                                  carouselPosition.value = index;
                                },
                              ),
                              items: AVATAR_LOGOS
                                  .map(
                                    (item) => Container(
                                      margin: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
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
                                      temporaryAvatarSrc.value =
                                          AVATAR_LOGOS[carouselPosition.value];
                                      Navigator.pop(context);
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        COLOR_SECONDARY,
                                      ),
                                    ),
                                    child: const Text(
                                      'Escolher',
                                      style: TextStyle(color: Colors.white),
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
                  padding: const EdgeInsets.all(50),
                  color: Colors.white,
                  icon: const Icon(
                    LineIcons.pen,
                    color: Colors.white,
                    size: 50,
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: _nameController,
                    cursorColor: COLOR_PRIMARY,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nome",
                      label: Text(
                        "Nome",
                        style: TextStyle(color: Colors.black),
                      ),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _ageController,
                    cursorColor: COLOR_PRIMARY,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Idade",
                      label: Text(
                        "Idade",
                        style: TextStyle(color: Colors.black),
                      ),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: COLOR_PRIMARY,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _weightController,
                          cursorColor: COLOR_PRIMARY,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffix: Text("kg"),
                            border: OutlineInputBorder(),
                            label: Text(
                              "Peso",
                              style: TextStyle(color: Colors.black),
                            ),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: COLOR_PRIMARY),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _heightController,
                          cursorColor: COLOR_PRIMARY,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffix: Text("cm"),
                            border: OutlineInputBorder(),
                            isDense: true,
                            label: Text(
                              "Altura",
                              style: TextStyle(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: COLOR_PRIMARY),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sexo",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 300,
                            child: DropdownButton<String>(
                              isDense: true,
                              value: sex,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              isExpanded: true,
                              iconEnabledColor: COLOR_PRIMARY,
                              onChanged: (value) {
                                setState(() {
                                  sex = value!;
                                });
                              },
                              items: <String>[
                                'Masculino',
                                'Feminino'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: TextButton(
                      onPressed: () => onSubmit(),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(COLOR_PRIMARY),
                      ),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
