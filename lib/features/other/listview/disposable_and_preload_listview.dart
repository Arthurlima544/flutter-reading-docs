import 'package:flutter/material.dart';

class DisposableAndPreLoadListview extends StatelessWidget {
  const DisposableAndPreLoadListview({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      addAutomaticKeepAlives:
          false, // remove all itens that passed in scrollview, so it need to rebuild again when is demanded
      cacheExtent:
          20, // y pre-loading items that are just outside the visible screen area.
      itemBuilder: (BuildContext context, int index) => Text(list[index]),
    );
  }
}
