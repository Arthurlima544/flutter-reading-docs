import 'package:flutter/material.dart';

class NeverScrollableExample extends StatelessWidget {
  const NeverScrollableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "This is an Example using NeverScrollableScrollPhysics This text will be treated as an item on the list to be scrollable ",
                  style: TextStyle(fontSize: 24),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, idx) => Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(child: Text("Item $idx")),
                  ),
                  itemCount: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
