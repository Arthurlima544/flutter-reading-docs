import 'package:flutter/material.dart';

class UsingIntrinsicHeightExample extends StatelessWidget {
  const UsingIntrinsicHeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Spacer(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("This is a Tile 1"),
                    ),
                  ),
                  Spacer(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("This is a Tile 2"),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("This is a Tile 3"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
