import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 100),
          child: GridView.extent(
            maxCrossAxisExtent: 150,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: List.generate(
              40,
              (i) => Image.network(
                "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
