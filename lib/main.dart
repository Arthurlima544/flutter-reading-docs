// ignore_for_file: avoid_print

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_learn/widgets/nice_fab_widget.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  debugPaintSizeEnabled = true;
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class Locations {
  final String imagePath;
  final String name;
  final String country;

  Locations({
    required this.imagePath,
    required this.name,
    required this.country,
  });
}

final locations = [
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/great-bear-rainforest.jpg",
    name: "Great Bear Rainforest",
    country: "Canada",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/burgundy.jpg",
    name: "Burgundy",
    country: "France",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
    name: "Bora Bora",
    country: "French Polynesia",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/asheville.jpg",
    name: "Asheville",
    country: "USA",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/antelope-canyon.jpg",
    name: "Antelope Canyon",
    country: "United States",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/angkor-wat.jpg",
    name: "Angkor Wat",
    country: "Cambodia",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/amazon-rainforest.jpg",
    name: "Amazon Rainforest",
    country: "Brazil",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/amalfi-coast.jpg",
    name: "Amalfi Coast",
    country: "Italy",
  ),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List<String>.generate(10000, (i) => 'Item $i');

    return MaterialApp(home: AnimatedFloatingActionButton());
  }
}

class ParalaxExample extends StatelessWidget {
  const ParalaxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTextStyle(
        style: descTextStyle,
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

final imageUrl =
    "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg";

final stars = Row(
  mainAxisSize: MainAxisSize.max,
  children: [
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
    Icon(CupertinoIcons.star, color: CupertinoColors.activeGreen, size: 14),
  ],
);

const descTextStyle = TextStyle(
  color: CupertinoColors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'San Francisco', //'Roboto
  letterSpacing: 0.5,
  fontSize: 16,
  height: 2,
);

@immutable
class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.country,
  });
  final String name;
  final String country;
  final String imagePath;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Paralax Background
              Flow(
                delegate: ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                  backgroundImageKey: _backgroundImageKey,
                ),
                children: [
                  Image.network(
                    imagePath,
                    key: _backgroundImageKey,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              // gradient
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                      stops: const [0.6, 0.95],
                    ),
                  ),
                ),
              ),
              // TItle and SubTitle
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      country,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // calculate position
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffSet = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );
    // perfcent of area
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffSet.dy / viewportDimension).clamp(
      0.0,
      1.0,
    );
    // calculate vertical align
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    // some weird shit
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );
    // paint background
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0.0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.circle, size: 40, color: Colors.amberAccent),
        Icon(Icons.notification_important_sharp, color: Colors.white),
      ],
    );
  }
}

class CupertinoSliverAppbar extends StatelessWidget {
  const CupertinoSliverAppbar({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTextStyle(
        style: descTextStyle,
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text("Cupertino Sliver App bar"),
              ),

              SliverList.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Container(
                  color: CupertinoColors.activeBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: CupertinoColors.black),
                      ),
                    ),
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

class MaterialSliverCustomAppbar extends StatelessWidget {
  const MaterialSliverCustomAppbar({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle.merge(
        style: descTextStyle,
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
    );
  }
}

class NiceScrollview extends StatelessWidget {
  const NiceScrollview({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 120,
      useMagnifier: true,
      magnification: 3,
      children: [
        ...list.map(
          (str) => Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(child: Text(str)),
            ),
          ),
        ),
      ],
    );
  }
}

class DraggebleAwesomeSheet extends StatelessWidget {
  const DraggebleAwesomeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.cyan,

              border: Border.all(width: 3, color: Colors.cyan),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(imageUrl),
                  ),
                  SizedBox(height: 20),
                  SkeletonLoader(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List<Widget>.generate(20, (_) {
            final aux = Random().nextInt(50) + 50;
            return SkeletonLine(width: 300 + aux.toDouble());
          }),
        ],
      ),
    );
  }
}

class SkeletonLine extends StatelessWidget {
  const SkeletonLine({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: width,
        height: 16.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

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

class GarbageColectorDisposableItens extends StatelessWidget {
  const GarbageColectorDisposableItens({super.key, required this.list});

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

class OptimizedListVieww extends StatelessWidget {
  const OptimizedListVieww({super.key, required this.list});

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

class OtherFormsOfLayout extends StatelessWidget {
  const OtherFormsOfLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Spacer(),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("This is a Tile 1"),
                  ),
                ),
                Spacer(),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("This is a Tile 2"),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("This is a Tile 3"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetsEsparsos extends StatelessWidget {
  const WidgetsEsparsos({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("This is a Tile 1"),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("This is a Tile 2"),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("This is a Tile 3"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Softwrap extends StatelessWidget {
  const Softwrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
      'Bernese Alps. Situated 1,578 meters above sea level, it '
      'is one of the larger Alpine Lakes. A gondola ride from '
      'Kandersteg, followed by a half-hour walk through pastures '
      'and pine forest, leads you to the lake, which warms to 20 '
      'degrees Celsius in the summer. Activities enjoyed here '
      'include rowing, and riding the summer toboggan run.',
      softWrap: true,
    );
  }
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 100),
      child: GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
          40,
          (i) => Image.network(
            "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
          ),
        ),
      ),
    );
  }
}

class ReplacedWidgets extends StatefulWidget {
  const ReplacedWidgets({super.key});

  @override
  State<ReplacedWidgets> createState() => _ReplacedWidgetsState();
}

class _ReplacedWidgetsState extends State<ReplacedWidgets> {
  int count = 100;

  // When the widget updates, not via State updates
  @override
  void didUpdateWidget(covariant ReplacedWidgets oldWidget) {
    // Never called, it need a Parent call to rebuild [ReplacedWidgets]
    print("Widget ${oldWidget.key} was updated by its parent!");

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Text("Counter $count", key: ValueKey("My Text Counter")),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) =>
          Center(child: Text("Hello $index")),
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: 20,
    );
  }
}

class PaddingMarginBorder extends StatelessWidget {
  const PaddingMarginBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoColors.activeGreen,
        border: Border.all(color: CupertinoColors.black, width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: EdgeInsets.all(10),
      child: Center(child: Text("Content")),
    );
  }
}

class RowsAndColumns extends StatelessWidget {
  const RowsAndColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 120, child: stars),
          Spacer(),
          Container(
            width: 200,
            height: 60,
            color: const Color.fromARGB(255, 146, 144, 144),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.phone,
                      color: CupertinoColors.destructiveRed,
                    ),
                    Text("Call"),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 50,
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(CupertinoIcons.phone),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "Call",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Image.network(
                  "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
