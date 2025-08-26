import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'skeleton_line.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List<Widget>.generate(20, (_) {
            final aux = Random().nextInt(50) + 50;
            return SkeletonLine(width: 300 + aux.toDouble());
          }),
        ],
      ),
    );
  }
}
