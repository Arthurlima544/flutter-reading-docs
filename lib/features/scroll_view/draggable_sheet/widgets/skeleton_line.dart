import 'package:flutter/material.dart';

class SkeletonLine extends StatelessWidget {
  const SkeletonLine({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: width,
        height: 16.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
