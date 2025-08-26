// ignore_for_file: avoid_print, unused_import

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/features/paralax/paralax.dart';
import 'package:flutter_learn/features/sliver_appbar/cupertino_sliver_appbar_example.dart';
import 'package:flutter_learn/features/sliver_appbar/material_sliver_appbar_example.dart';
import 'package:flutter_learn/features/scroll_view/wheel_scroll_view_example.dart';
import 'package:flutter_learn/utils/locations.dart';
import 'package:flutter_learn/features/nice_fab_widget.dart';
import 'package:flutter_learn/utils/textstyles.dart';
import 'package:flutter_learn/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import 'features/scroll_view/draggable_sheet/draggable_sheet_example.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List<String>.generate(10000, (i) => 'Item $i');

    return PaddingMarginBorder();
  }
}

class PaddingMarginBorder extends StatelessWidget {
  const PaddingMarginBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class RowsAndColumns extends StatelessWidget {
  const RowsAndColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
