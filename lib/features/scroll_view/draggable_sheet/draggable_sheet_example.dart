import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'widgets/skeleton_loader.dart';

class DraggableSheetExample extends StatelessWidget {
  const DraggableSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.1,
          builder: (context, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,

                  border: Border.all(width: 3, color: Colors.cyan),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: Image.network(imageUrl),
                      ),
                      SizedBox(height: 20),
                      SkeletonLoader(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
