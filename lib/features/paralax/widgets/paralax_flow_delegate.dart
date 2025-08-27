import 'package:flutter/widgets.dart';

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
      height: constraints.maxHeight * 1.4,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;

    final listItemOffset = listItemBox.localToGlobal(
      Offset.zero,
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final itemCenter = listItemOffset.dy + (listItemBox.size.height / 2);
    final alignment =
        (itemCenter - (viewportDimension / 2)) / (viewportDimension / 2);

    final background =
        backgroundImageKey.currentContext!.findRenderObject() as RenderBox;

    final maxScrollExtent = (background.size.height - context.size.height);

    final verticalOffset = alignment * maxScrollExtent / 2;

    final transform = Transform.translate(
      offset: Offset(0.0, verticalOffset),
    ).transform;

    context.paintChild(0, transform: transform);
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
