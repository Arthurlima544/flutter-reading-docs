import 'package:flutter/material.dart';

class ComposedMaterialIcons extends StatelessWidget {
  const ComposedMaterialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.circle, size: 40, color: Colors.amberAccent),
        Icon(Icons.notification_important_sharp, color: Colors.white),
      ],
    );
  }
}
