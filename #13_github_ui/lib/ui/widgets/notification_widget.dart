import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {

  final int notificationType;
  final String issue;
  final String title;
  final String description;
  final String timestamp;
  final String profilePic;

  const NotificationWidget({Key key, this.notificationType, this.issue, this.title, this.description, this.timestamp, this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getNotificationIcon(notificationType),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 10,
                      children: <Widget>[
                        Text(issue ?? "",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: <Widget>[
                            ClipRRect(child: Image.network(profilePic,
                              height: 24,
                              width: 24,
                            ),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            SizedBox(width: 12,),
                            Text(description, style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text(timestamp ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }


  Widget _getNotificationIcon(int notificationType) {
    switch (notificationType) {
      case 0:
        return Icon(Icons.info_outline, color: Colors.green,);
      case 1:
        return Icon(Icons.check_circle_outline, color: Colors.red.shade700,);
      case 2:
        return Icon(Icons.merge_type, color: Colors.deepPurple,);
    }
    return Icon(Icons.close);
  }


}
