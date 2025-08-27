import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/features/paralax/widgets/location_list_item.dart';
import 'package:flutter_learn/utils/locations.dart';
import 'package:flutter_learn/utils/textstyles.dart';

class ParalaxGridview extends StatelessWidget {
  const ParalaxGridview({super.key});

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
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                ),
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
