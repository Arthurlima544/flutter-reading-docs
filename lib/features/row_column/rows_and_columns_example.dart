import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/utils/utils.dart';

class RowsAndColumnsExample extends StatelessWidget {
  const RowsAndColumnsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 120, child: stars),
              Spacer(),
              Container(
                width: 200,
                height: 60,
                color: const Color.fromARGB(255, 146, 144, 144),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.phone,
                          color: CupertinoColors.destructiveRed,
                        ),
                        Text("Call"),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 50,
                      child: ListView(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(CupertinoIcons.phone),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              "Call",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.network(
                      "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
