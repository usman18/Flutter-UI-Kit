import 'package:github_ui/constants.dart';
import 'package:github_ui/model/notification.dart';

class NotificationProvider {
  static final List<Notification> notifications = [
    Notification(
        notificationType: Notification.ISSUE_OPEN,
        title: "firebase dynamic link dependency not working",
        description: "Hi. It now works with the latest version. Thank you",
        issue: "FirebaseExtended / flutterfire #1438",
        userProfilePic: kProfilePic,
        timestamp: "8d"),
    Notification(
        notificationType: Notification.ISSUE_CLOSED,
        title: "parse_server_sdk >= 1.0.25 is forbidden",
        issue: "parse-community / Parse-SDK-Flutter #303",
        description: "Closed #303",
        userProfilePic: kProfilePic,
        timestamp: "20d"),
    Notification(
        notificationType: Notification.MERGED,
        title: "Timer bug resolved",
        description: "Merged #6 into master",
        issue: "somerepo / issue #123",
        userProfilePic: kProfilePic,
        timestamp: "2mo"),
  ];
}
