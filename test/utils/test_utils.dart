import 'package:flutter/widgets.dart';

List<double> commonAspectRatios = [
  16 / 9,
  18 / 9,
  19.5 / 9,
  4 / 3,
  3 / 2,
  21 / 9,
];

List<double> commonDPRs = [
  0.5,
  0.75,
  1.0,
  1.25,
  1.5,
  1.75,
  2.0,
  2.5,
  3.0,
  3.5,
  4.0,
];

Map<String, List<Size>> devicesSizes = {
  "watches": [Size(136, 170), Size(162, 197), Size(184, 224)],
  "phones": [
    Size(360, 640),
    Size(375, 812),
    Size(390, 844),
    Size(412, 915),
    Size(428, 926),
  ],
  "tablets": [
    Size(600, 1024),
    Size(768, 1024),
    Size(834, 1112),
    Size(820, 1180),
  ],
  "notebooks": [
    Size(1280, 800),
    Size(1366, 768),
    Size(1440, 900),
    Size(1536, 864),
    Size(1920, 1080),
  ],
  "bigscreens": [Size(1280, 720), Size(1920, 1080), Size(3840, 2160)],
};
