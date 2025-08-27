import 'package:flutter/widgets.dart';

List<double> commonAspectRatios = [
  16 / 9,
  18 / 9,
  19.5 / 9,
  4 / 3,
  3 / 2,
  21 / 9,
];

List<double> commonDPRs = [1.0, 1.5, 2.0];

Map<String, List<Size>> devicesSizes = {
  "watches": [Size(162, 197)],
  "phones": [Size(390, 844)],
  "tablets": [Size(768, 1024)],
  "notebooks": [Size(1440, 900)],
  "bigscreens": [Size(3840, 2160)],
};
