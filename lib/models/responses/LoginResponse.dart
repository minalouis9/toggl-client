import 'package:flutter/material.dart';

import '../Clients.dart';
import '../Projects.dart';
import '../Tags.dart';
import '../Tasks.dart';
import '../User.dart';
import '../Workspaces.dart';

class LoginResponse {
  User user;
  List<Projects> projects;
  List<Tasks> tasks;
  List<Tags> tags;
  List<Clients> clients;
  List<Workspaces> workspaces;

  LoginResponse(
      {this.user,
      this.projects,
      this.tasks,
      this.clients,
      this.workspaces,
      this.tags});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> list1 = json["projects"];
    List<Projects> projectsList;
    if (list1 != null)
      projectsList = list1.map((e) => Projects.fromJson(e)).toList();
    else
      projectsList = List();

    List<dynamic> list2 = json["tasks"];
    List<Tasks> tasksList;
    if (list2 != null)
      tasksList = list2.map((e) => Tasks.fromJson(e)).toList();
    else
      tasksList = List();

    List<dynamic> list3 = json["tags"];
    List<Tags> tagsList;
    if (list3 != null)
      tagsList = list3.map((e) => Tags.fromJson(e)).toList();
    else
      tagsList = List();

    List<dynamic> list4 = json["clients"];
    List<Clients> clientsList;
    if (list4 != null)
      clientsList = list4.map((e) => Clients.fromJson(e)).toList();
    else
      clientsList = List();

    List<dynamic> list5 = json["workspaces"];
    List<Workspaces> workspacesList;
    if (list5 != null)
      workspacesList = list5.map((e) => Workspaces.fromJson(e)).toList();
    else
      workspacesList = List();

    return LoginResponse(
      user: User.fromJson(json),
      projects: projectsList,
      tasks: tasksList,
      tags: tagsList,
      clients: clientsList,
      workspaces: workspacesList,
    );
  }
}

class LoginResponseProvider extends ChangeNotifier{
  LoginResponse loginResponse;

  onLoginResponse(LoginResponse newLoginResponse){
    this.loginResponse = newLoginResponse;
    notifyListeners();
  }
}