import 'package:flutter/material.dart';

class FixedExtentScrollPhysicsExample extends StatelessWidget {
  const FixedExtentScrollPhysicsExample({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListWheelScrollView(
            useMagnifier: true,
            magnification: 4,
            physics: FixedExtentScrollPhysics(),
            itemExtent: MediaQuery.sizeOf(context).width,
            children: [...list.map((e) => Center(child: Text(e)))],
          ),
        ),
      ),
    );
  }
}
