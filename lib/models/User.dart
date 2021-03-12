import 'package:flutter/foundation.dart';

class User{
  String apiToken, email, fullName, language;
  int id, defaultWID;
  // bool timelineEnabled, recordTimeline, renderTimeline;

  User(
      {this.apiToken,
      this.email,
      this.fullName,
      this.language,
      this.id,
      this.defaultWID});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      apiToken: json["api_token"],
      email: json["email"],
      fullName: json["fullname"],
      defaultWID: json["default_wid"],
      language: json["language"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "api_token": apiToken,
      "fullname": fullName,
      "email": email,
      "default_wid": defaultWID,
      "language": language
    };
  }
}

class UserProvider extends ChangeNotifier{
  User user;

  onNewUser(User newUser){
    this.user = newUser;
    notifyListeners();
  }
}