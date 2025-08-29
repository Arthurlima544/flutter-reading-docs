import 'package:flutter/cupertino.dart';

/// Only works in Mobile
/// https://github.com/flutter/flutter/issues/134871#issuecomment-1722603755
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
            child: ListView.builder(
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Hello There How is you going? I'm Great this is a Basic Template",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
