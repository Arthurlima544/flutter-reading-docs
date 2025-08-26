import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/features/paralax/widgets/paralax_flow_delegate.dart';

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
                        CupertinoColors.transparent,
                        CupertinoColors.black.withValues(alpha: 0.7),
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
                        color: CupertinoColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      country,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 14,
                      ),
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
