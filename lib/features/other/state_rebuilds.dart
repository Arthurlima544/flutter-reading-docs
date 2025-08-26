import 'package:flutter/widgets.dart';

class StateRebuilds extends StatefulWidget {
  const StateRebuilds({super.key});

  @override
  State<StateRebuilds> createState() => _StateRebuildsState();
}

class _StateRebuildsState extends State<StateRebuilds> {
  int count = 100;

  // When the widget updates, not via State updates
  @override
  void didUpdateWidget(covariant StateRebuilds oldWidget) {
    // Never called, it need a Parent call to rebuild [ReplacedWidgets]
    print("Widget ${oldWidget.key} was updated by its parent!");

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Text("Counter $count", key: ValueKey("My Text Counter")),
    );
  }
}
