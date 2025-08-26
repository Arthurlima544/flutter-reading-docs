import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/textstyles.dart';

class MaterialSliverAppbarExample extends StatelessWidget {
  const MaterialSliverAppbarExample({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DefaultTextStyle.merge(
          style: descTextStyleMaterial,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                // floating: true,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Sliver App Bar",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  background: Image.asset(
                    'assets/landscape.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(list[index])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
