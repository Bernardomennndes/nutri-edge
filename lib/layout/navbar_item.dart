import 'package:flutter/material.dart';
import 'package:nutri_edge/style/colors.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final void Function() onPressed;
  const NavbarItem({super.key, required this.icon, required this.text, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(COLOR_PRIMARY)
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color ?? COLOR_SECONDARY,
          ),
          Text(
            text,
            style: TextStyle(
              color: color ?? COLOR_SECONDARY
            ),
          )
        ],
      ),
    );
  }
}