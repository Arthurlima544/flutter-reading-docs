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
                          icon: Icon(Icons.home),
                          label: Text("Home"),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.notification_important_rounded),
                          label: Text("Notification"),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.date_range_rounded),
                          label: Text("Date"),
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
                  Destination(
                    hasTitle: false, // showTitle?
                    iconData: Icons.home,
                    title: "Home",
                  ),
                  Destination(
                    hasTitle: false, // showTitle?
                    iconData: Icons.notification_important_rounded,
                    title: "Notification",
                  ),
                  Destination(
                    hasTitle: false, // showTitle?
                    iconData: Icons.date_range_rounded,
                    title: "Notification",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({
    super.key,
    required this.iconData,
    required this.title,
    required this.hasTitle,
  });

  final IconData iconData;
  final String title;
  final bool hasTitle;

  @override
  Widget build(BuildContext context) {
    return hasTitle
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(iconData), SizedBox(height: 5), Text(title)],
          )
        : Icon(iconData);
  }
}
