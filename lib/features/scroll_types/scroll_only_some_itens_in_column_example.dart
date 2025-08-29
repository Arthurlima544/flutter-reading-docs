import 'package:flutter/material.dart';

class ScrollOnlySomeItemsInColumnExample extends StatelessWidget {
  const ScrollOnlySomeItemsInColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "This is an Example Where This text will not move",
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, idx) => Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(child: Text("Item $idx")),
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
