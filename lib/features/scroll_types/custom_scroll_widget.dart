import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class CustomScrollWidget extends StatefulWidget {
  const CustomScrollWidget({super.key});

  @override
  State<CustomScrollWidget> createState() => _CustomScrollWidgetState();
}

class _CustomScrollWidgetState extends State<CustomScrollWidget> {
  late final ScrollController _controller;
  late bool isMouseScroll;

  @override
  void initState() {
    super.initState();
    isMouseScroll = false;
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          print("Scroll Event: ($event)");
          setState(() {
            isMouseScroll = true;
          });
        } else {
          isMouseScroll = false;
        }
      },
      child: ListView(
        controller: _controller,
        physics: isMouseScroll ? ClampingScrollPhysics() : null,
        children: [
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
          const BasicListItem(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BasicListItem extends StatelessWidget {
  const BasicListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(50),
      child: Text(
        "Hello There How is you going? I'm Great this is a Basic Template",
      ),
    );
  }
}
