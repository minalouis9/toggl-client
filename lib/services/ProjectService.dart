import 'dart:convert';
import 'dart:io';

import 'package:toggl_client_app/models/Projects.dart';
import 'package:toggl_client_app/services/APIClient.dart';

import 'package:http/http.dart' as http;

class ProjectService{
  static final ProjectService _instance = ProjectService._getInstance();

  factory ProjectService() {
    return _instance;
  }

  ProjectService._getInstance();

  Future<Map<bool,Projects>> getProjectByID(apiToken, projectID) async {
    print("In project service");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));
    final http.Response response = await http.get("${APIClient.baseURL}projects/$projectID",
        headers: {HttpHeaders.authorizationHeader: basicAuth});
    // print(jsonDecode(response.body).toString());
    if (response.statusCode == 200)
    {
      print("project retrieved successful");
      return {true:Projects.fromJson(jsonDecode(response.body)['data'])};
    }
    else
    {
      print("project retrieved failed");
      return {false:Projects()};
    }
  }
}