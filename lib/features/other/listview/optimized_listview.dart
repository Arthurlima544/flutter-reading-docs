import 'package:flutter/material.dart';

class OptimizedListView extends StatelessWidget {
  const OptimizedListView({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      prototypeItem: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.ac_unit_rounded),
              Spacer(),
              Text(list.first),
              Spacer(),
            ],
          ),
        ),
      ),
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.ac_unit_rounded),
                Spacer(),
                Text(list[index]),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
