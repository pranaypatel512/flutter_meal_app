import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.iconData, required this.label});

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,size: 17,color: Colors.white,),
        const SizedBox(width: 6,),
        Text(label,style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
