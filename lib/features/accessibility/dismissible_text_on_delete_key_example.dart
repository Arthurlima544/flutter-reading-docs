import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Press TAB + DELETE and See the magic happening :)
class DismissibleTextExample extends StatelessWidget {
  const DismissibleTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: SafeArea(child: FadeOutEventOnDeletePressed())),
    );
  }
}

class FadeOutEventOnDeletePressed extends StatefulWidget {
  const FadeOutEventOnDeletePressed({super.key});

  @override
  State<FadeOutEventOnDeletePressed> createState() =>
      _FadeOutEventOnDeletePressedState();
}

class _FadeOutEventOnDeletePressedState
    extends State<FadeOutEventOnDeletePressed> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Focus(
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey.keyLabel == "Backspace") {
              setState(() {
                _isVisible = !_isVisible;
              });
            }
          }
          return KeyEventResult.ignored;
        },
        child: AnimatedOpacity(
          opacity: _isVisible ? 1 : 0.0,
          duration: Duration(milliseconds: 300),
          key: ValueKey("Dismissable Text"),
          child: Text(
            "Hello There How is you going? I'm Great this is a Basic Template",
          ),
        ),
      ),
    );
  }
}
