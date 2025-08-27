import 'package:flutter/material.dart';
import 'package:flutter_learn/features/adaptative_card_text/adaptative_card_text_example.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  group('AdaptativeCardTextExample Golden Tests', () {
    for (double currentDPR in commonDPRs) {
      devicesSizes.forEach((currentDeviceName, deviceSizeList) {
        for (Size currentDeviceSize in deviceSizeList) {
          final String filename =
              "adaptative_card_text_example$currentDeviceName$currentDPR$currentDeviceSize";
          goldenTestAdaptativeCard(
            currentDeviceName,
            currentDPR,
            currentDeviceSize,
            filename,
          );
        }
      });
    }
  });
}

void goldenTestAdaptativeCard(
  String currentDeviceName,
  double currentDPR,
  Size currentDeviceSize,
  String filename,
) {
  testWidgets(
    '$currentDeviceName: Device Pixel Ratio $currentDPR : Device Size: $currentDeviceSize',
    (tester) async {
      final devicePixelRatio = currentDPR;
      final Size physicalSize = currentDeviceSize;

      tester.view.devicePixelRatio = devicePixelRatio;
      tester.view.physicalSize = physicalSize;

      await tester.binding.setSurfaceSize(physicalSize);
      await tester.pumpWidget(AdaptativeCardTextExample());

      await expectLater(
        find.byType(AdaptativeCardTextExample),
        matchesGoldenFile('../../../../test_golden_images/$filename.png'),
      );
    },
  );
}
