

import 'package:github_ui/model/repository.dart';

import '../constants.dart';

class RepositoryProvider {

  static final List<Repository> repositories = [
    Repository(profilePicUrl: kProfilePic, username: "usman18", repository: "Flutter-UI-Kit",
      description: "A repository full of beautiful Flutter examples",
      language: "Dart",
      stars: 58,
    ),
    Repository(profilePicUrl: kProfilePic, username: "usman18", repository: "TastyToasty",
      description: "An easy-to-use library to create tasty Toasts with a bunch of flavours.",
      language: "Java",
      stars: 28,
    ),
  ];



}