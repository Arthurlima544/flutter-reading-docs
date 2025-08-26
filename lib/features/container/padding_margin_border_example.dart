import 'package:flutter/cupertino.dart';

class PaddingMarginBorderExample extends StatelessWidget {
  const PaddingMarginBorderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.activeGreen,
              border: Border.all(color: CupertinoColors.black, width: 4),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.all(10),
            child: Center(child: Text("Content")),
          ),
        ),
      ),
    );
  }
}
