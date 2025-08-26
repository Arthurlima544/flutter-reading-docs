import 'package:flutter/cupertino.dart';

final imageUrl =
    "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg";

final stars = Row(
  mainAxisSize: MainAxisSize.max,
  children: [
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
  ],
);
