import 'package:flutter/material.dart';
import 'package:nutri_edge/style/constants.dart';

class GenericCard extends StatelessWidget {
  const GenericCard({
    super.key,
    required this.isSelected,
    required this.text,
    required this.iconSrc,
  });
  final bool isSelected;
  final String text;
  final String iconSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? COLOR_SECONDARY : Colors.black26,
          width: isSelected ? 3 : 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(iconSrc),
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? COLOR_SECONDARY : Colors.black,
                fontSize: 22,
                // fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
