import 'package:flutter/material.dart';

class SeparatedListview extends StatelessWidget {
  const SeparatedListview({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (BuildContext context, int index) => Text(list[index]),
    );
  }
}
