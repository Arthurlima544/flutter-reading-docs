import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton({super.key});

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Awesome Floating Action Buttons")),
      floatingActionButton: Flow(
        delegate: ButtonDelegate(animation: animation),
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
              onPressed: () {
                if (!animation.isCompleted) {
                  animation.forward();
                } else {
                  animation.reverse();
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              icon: Icon(Icons.list, color: Colors.black),
            ),
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
              icon: Icon(Icons.add, color: Colors.black),
            ),
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              icon: Icon(Icons.remove, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonDelegate extends FlowDelegate {
  final Animation<double> animation;

  ButtonDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    final Size parentSize = context.size;
    final Size childSize = context.getChildSize(0)!;
    final Rect parentRect = Rect.fromLTWH(
      0,
      0,
      parentSize.width,
      parentSize.height,
    );
    final Rect childRect = Alignment.bottomRight.inscribe(
      childSize,
      parentRect,
    );

    for (var i = context.childCount - 1; i >= 0; i--) {
      if (i == 0) {
        context.paintChild(
          0,
          transform: Matrix4.translationValues(
            childRect.left,
            childRect.top,
            0.0,
          ),
        );
      } else {
        final offset = i * animation.value * 50;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(
            childRect.left - offset,
            childRect.top - offset,
            0.0,
          ),
        );
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(160, 160);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return const BoxConstraints.tightFor(width: 60, height: 60);
  }

  @override
  bool shouldRepaint(covariant ButtonDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}
