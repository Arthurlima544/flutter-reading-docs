import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/utils/textstyles.dart';

class CupertinoSliverAppbarExample extends StatelessWidget {
  const CupertinoSliverAppbarExample({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTextStyle(
        style: descTextStyleCupertino,
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text("Cupertino Sliver App bar"),
              ),

              SliverList.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Container(
                  color: CupertinoColors.activeBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: CupertinoColors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
