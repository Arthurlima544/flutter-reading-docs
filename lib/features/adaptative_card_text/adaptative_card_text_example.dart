import 'package:flutter/material.dart';

import '../../utils/locations.dart';
import 'widgets/adaptative_card_text.dart';

final simplelestLorem = "Lorem ipsum dolor sit amet";
final simpleLorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a consectetur nisi. Fusce iaculis erat quis quam sagittis iaculis. ";
final lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a consectetur nisi. Fusce iaculis erat quis quam sagittis iaculis. In nec arcu nec metus lobortis feugiat sed id turpis. Vestibulum malesuada non ex vitae venenatis. Aliquam vel tortor odio. Proin aliquet mi metus, sit amet sagittis enim maximus vel. Fusce condimentum nisi eget elementum mattis. Donec placerat diam magna, vel sagittis tellus convallis et. Duis non quam sed libero pharetra suscipit id vitae ligula. Fusce elementum felis neque, sit amet condimentum nulla cursus varius. Fusce lectus mauris, dictum non eleifend vehicula, gravida in urna. Duis tempor, lectus at pharetra viverra, elit nunc porttitor tortor, a elementum ex leo sed quam. Sed arcu lacus, maximus vel elementum id, dictum quis turpis. Suspendisse accumsan facilisis quam eu consequat. Maecenas lacus dolor, consequat a odio a, luctus convallis felis. Nullam ut lacus volutpat, posuere ligula id, congue nibh. Sed lectus justo, dictum sed dignissim at, rhoncus luctus nunc. Donec at nisl at ligula rhoncus sagittis eu a nibh. Vivamus a purus metus. Nam vestibulum diam odio, ut rutrum nisi vulputate id. Proin rhoncus ante et rutrum bibendum. Etiam facilisis ultricies arcu, at egestas mi vestibulum at. Donec non bibendum mi. Morbi at efficitur eros. Proin viverra nibh id scelerisque suscipit. Morbi maximus posuere velit, ut ullamcorper massa eleifend non. Fusce id odio est. Duis rhoncus, lorem vel pretium gravida, sapien metus placerat quam, sit amet scelerisque quam mauris in eros. Vivamus a molestie lectus. In hac habitasse platea dictumst. Nulla facilisi. Ut id est nisl. Integer fringilla, nisl ut imperdiet pulvinar, sapien lacus posuere metus, quis egestas nibh lacus nec quam. Vestibulum ac suscipit magna, eu vulputate lectus. Pellentesque ac neque odio. Vestibulum euismod lectus nec imperdiet tempor. Etiam lectus nisl, bibendum a euismod id, laoreet eu risus. Morbi mollis ut ante porta efficitur. Duis hendrerit elit vel lectus cursus, vitae imperdiet tellus fringilla. Maecenas feugiat nunc ligula, nec tempor mi suscipit eu. Cras metus tellus, bibendum ultricies arcu nec, lobortis facilisis leo. Quisque eu est ex. Pellentesque bibendum vel mi sed tempor. Sed vel arcu id lorem ultrices pulvinar at vitae nisl. Quisque posuere purus elit, vel tempor nisl placerat ut. Vivamus interdum dapibus lectus, ut dictum lectus blandit vel. Maecenas sagittis porta ligula, non hendrerit magna eleifend eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec et justo felis. Integer lectus lectus, sagittis a diam non, efficitur vulputate erat. Nunc sodales convallis elit a fermentum. Aliquam lorem tortor, congue vel nunc id, auctor gravida orci. Duis vitae urna laoreet, mattis dui nec, feugiat orci. Mauris semper, nunc quis ornare scelerisque, purus magna malesuada felis, a ullamcorper nisi sapien quis diam. In libero ante, consectetur sed diam sed, varius commodo nulla. Donec lacinia lorem vitae dui finibus porttitor.";

class AdaptativeCardTextExample extends StatelessWidget {
  const AdaptativeCardTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(15),
            children: [
              AdaptativeCardText(
                imagePath: locations[0].imagePath,
                text: lorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[1].imagePath,
                text: simplelestLorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[2].imagePath,
                text: simpleLorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[3].imagePath,
                text: simpleLorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[4].imagePath,
                text: lorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[5].imagePath,
                text: simplelestLorem,
              ),
              SizedBox(height: 15),
              AdaptativeCardText(
                imagePath: locations[6].imagePath,
                text: simpleLorem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
