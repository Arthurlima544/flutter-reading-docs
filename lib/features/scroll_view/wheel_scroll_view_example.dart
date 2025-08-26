import 'package:flutter/material.dart';

class WheelScrollViewExample extends StatelessWidget {
  const WheelScrollViewExample({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListWheelScrollView(
          itemExtent: 120,
          useMagnifier: true,
          magnification: 3,
          children: [
            ...list.map(
              (str) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: Text(str)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
