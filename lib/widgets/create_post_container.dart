import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/resonsive.dart';

import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        // removes line under text
                        hintText: 'What\'s on your mind?'),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () => print('Live'),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text('Live'),
                  ),
                  const VerticalDivider(width: 8),
                  FlatButton.icon(
                    onPressed: () => print('Photo'),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text('Photo'),
                  ),
                  const VerticalDivider(width: 8),
                  FlatButton.icon(
                    onPressed: () => print('Room'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text('Room'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
