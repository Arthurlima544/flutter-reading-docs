import 'package:flutter/material.dart';
import 'package:flutter_learn/features/dialog/widgets/dialog_child.dart';

import '../../utils/locations.dart';

class ResponsibleAdaptativeDialogExample extends StatelessWidget {
  const ResponsibleAdaptativeDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ResponsiveAdaptativeDialog());
  }
}

class ResponsiveAdaptativeDialog extends StatelessWidget {
  const ResponsiveAdaptativeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  final showFullScreenDialog =
                      MediaQuery.sizeOf(context).height > 900; //1000

                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => showFullScreenDialog
                        ? Dialog.fullscreen(child: DialogChild())
                        : Dialog(child: DialogChild()),
                  );
                },
                child: Image.network(locations[0].imagePath),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
