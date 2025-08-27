import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AdaptativeCardText extends StatelessWidget {
  const AdaptativeCardText({
    super.key,
    required this.imagePath,
    required this.text,
  });
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageConstraint = (constraints.maxWidth * 0.3).clamp(80.0, 160.0);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.network(
                    imagePath,
                    width: imageConstraint,
                    height: imageConstraint,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      text,
                      style: TextStyle(fontSize: 24), // start font size
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
