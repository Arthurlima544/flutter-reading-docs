import 'package:flutter/material.dart';

class MouseHoverExample extends StatefulWidget {
  const MouseHoverExample({super.key});

  @override
  State<MouseHoverExample> createState() => _MouseHoverExampleState();
}

class _MouseHoverExampleState extends State<MouseHoverExample> {
  bool isHoovering = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Is hovering App? ",
                    children: [
                      TextSpan(
                        text: isHoovering.toString(),
                        style: TextStyle(
                          color: isHoovering ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                MouseRegion(
                  onHover: (event) => setState(() => isHoovering = true),
                  onExit: (event) => setState(() => isHoovering = false),
                  child: Container(color: Colors.red, height: 100, width: 100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
