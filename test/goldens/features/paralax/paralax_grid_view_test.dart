import 'package:flutter/material.dart';
import 'package:flutter_learn/features/paralax/paralax_gridview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_utils.dart';

void main() {
  group('ParalaxGridView Golden Tests', () {
    for (double currentDPR in commonDPRs) {
      devicesSizes.forEach((currentDeviceName, deviceSizeList) {
        for (Size currentDeviceSize in deviceSizeList) {
          final String filename =
              "ParalaxGridView$currentDeviceName$currentDPR$currentDeviceSize";
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
      await tester.pumpWidget(ParalaxGridview());

      await expectLater(
        find.byType(ParalaxGridview),
        matchesGoldenFile('../../../../test_golden_images/$filename.png'),
      );
    },
  );
}
