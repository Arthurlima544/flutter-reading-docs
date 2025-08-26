import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/features/paralax/widgets/location_list_item.dart';
import 'package:flutter_learn/utils/locations.dart';
import 'package:flutter_learn/utils/textstyles.dart';

class ParalaxExample extends StatelessWidget {
  const ParalaxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTextStyle(
        style: descTextStyleCupertino,
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(largeTitle: Text("Paralax Example")),
              SliverList.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) => LocationListItem(
                  name: locations[index].name,
                  imagePath: locations[index].imagePath,
                  country: locations[index].country,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
