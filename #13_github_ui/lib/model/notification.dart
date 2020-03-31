
class Notification {

  static const int ISSUE_OPEN = 0;
  static const int ISSUE_CLOSED = 1;
  static const int MERGED = 2;
  //And you can add more notification types. I am going ahead with the above three for brevity

  int notificationType;
  String issue;
  String title;
  String description;
  String timestamp;
  String userProfilePic;

  Notification({this.notificationType, this.issue, this.title, this.description, this.timestamp, this.userProfilePic});


}