import 'package:flutter/material.dart';
import 'package:nutri_edge/layout/navbar_item.dart';
import 'package:nutri_edge/style/constants.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)!.settings.name!;

    return BottomAppBar(
      height: 65,
      color: Colors.white,
      padding: const EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavbarItem(
            icon: Icons.home_outlined,
            text: "Início",
            color: currentRoute == "/" ? COLOR_PRIMARY : null,
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          NavbarItem(
            icon: Icons.list_alt_sharp,
            text: "Dietas",
            color: currentRoute == "/diets" ? COLOR_PRIMARY : null,
            onPressed: () => Navigator.pushReplacementNamed(context, '/diets'),
          ),
          NavbarItem(
            icon: Icons.person,
            text: "Perfil",
            color: currentRoute == "/profile" ? COLOR_PRIMARY : null,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/profile'),
          ),
        ],
      ),
    );
  }
}
