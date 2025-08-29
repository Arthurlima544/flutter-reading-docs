import 'package:flutter/material.dart';

class FocusableActionDetectorExample extends StatefulWidget {
  const FocusableActionDetectorExample({super.key});

  @override
  State<FocusableActionDetectorExample> createState() =>
      _FocusableActionDetectorExampleState();
}

class _FocusableActionDetectorExampleState
    extends State<FocusableActionDetectorExample> {
  bool hasFocusText = false;
  bool hasFocusPhoto = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FocusableActionDetector(
                  onFocusChange: (value) => setState(() => hasFocusText = true),
                  actions: <Type, Action<Intent>>{
                    ActivateIntent: CallbackAction<Intent>(
                      onInvoke: (intent) {
                        print('Focus Text');
                        return null;
                      },
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: hasFocusText
                          ? Colors.orange.shade100
                          : Colors.grey.shade200,
                      border: Border.all(
                        color: hasFocusText
                            ? Colors.orange
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Hello There How is you going? I'm Great this is a Basic Template",
                    ),
                  ),
                ),
                SizedBox(height: 40),
                FocusableActionDetector(
                  onFocusChange: (value) =>
                      setState(() => hasFocusPhoto = true),
                  actions: <Type, Action<Intent>>{
                    ActivateIntent: CallbackAction<Intent>(
                      onInvoke: (intent) {
                        print('Focus Flutter logo');
                        return null;
                      },
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: hasFocusPhoto
                          ? Colors.orange.shade100
                          : Colors.grey.shade200,
                      border: Border.all(
                        color: hasFocusPhoto
                            ? Colors.orange
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FlutterLogo(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
