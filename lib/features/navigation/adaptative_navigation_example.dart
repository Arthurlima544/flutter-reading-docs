import 'package:flutter/material.dart';

class AdaptativeNavigationExample extends StatelessWidget {
  const AdaptativeNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool useNavigationRail = constraints.maxWidth > 600;
            bool showTitle = constraints.maxWidth > 800;
            print(
              "${constraints.maxWidth} -> NavigationRail:  -> Title: $showTitle ",
            );
            if (useNavigationRail) {
              return Scaffold(
                body: Row(
                  children: [
                    NavigationRail(
                      labelType: showTitle
                          ? NavigationRailLabelType.all
                          : NavigationRailLabelType.none,
                      destinations: [
                        NavigationRailDestination(
                          icon: destinationList[0].icon,
                          label: destinationList[0].label,
                        ),
                        NavigationRailDestination(
                          icon: destinationList[1].icon,
                          label: destinationList[1].label,
                        ),
                        NavigationRailDestination(
                          icon: destinationList[2].icon,
                          label: destinationList[2].label,
                        ),
                      ],
                      selectedIndex: 0,
                    ),
                    Center(child: Text("Adaptative Navigation Bar")),
                  ],
                ),
              );
            }
            return Scaffold(
              body: Center(child: Text("Adaptative Navigation Bar")),
              bottomNavigationBar: NavigationBar(
                destinations: [
                  destinationList[0].icon,
                  destinationList[1].icon,
                  destinationList[2].icon,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final destinationList = [
  Destination(icon: Icon(Icons.home), label: Text("Home")),
  Destination(
    icon: Icon(Icons.notification_important_rounded),
    label: Text("Notification"),
  ),
  Destination(
    icon: Icon(Icons.date_range_rounded),
    label: Text("Notification"),
  ),
];

class Destination {
  final Icon icon;
  final Text label;

  const Destination({required this.icon, required this.label});
}
