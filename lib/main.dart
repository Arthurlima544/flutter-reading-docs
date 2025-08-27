// ignore_for_file: avoid_print, unused_import

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/features/container/padding_margin_border_example.dart';
import 'package:flutter_learn/features/navigation/adaptative_navigation_example.dart';
import 'package:flutter_learn/features/paralax/paralax.dart';
import 'package:flutter_learn/features/row_column/rows_and_columns_example.dart';
import 'package:flutter_learn/features/sliver_appbar/cupertino_sliver_appbar_example.dart';
import 'package:flutter_learn/features/sliver_appbar/material_sliver_appbar_example.dart';
import 'package:flutter_learn/features/scroll_view/wheel_scroll_view_example.dart';
import 'package:flutter_learn/utils/locations.dart';
import 'package:flutter_learn/features/nice_fab_widget.dart';
import 'package:flutter_learn/utils/textstyles.dart';
import 'package:flutter_learn/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import 'features/dialog/responsible_adaptative_dialog_example.dart';
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

    return AdaptativeNavigationExample();
  }
}
