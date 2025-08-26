import 'package:flutter/material.dart';

class SeeScrollINListview extends StatelessWidget {
  const SeeScrollINListview({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      thumbVisibility: true,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => Text(list[index]),
      ),
    );
  }
}
