import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:toggl_client_app/models/responses/LoginResponse.dart';

import 'APIClient.dart';

class LoginService{
  static final LoginService _instance = LoginService._getInstance();

  factory LoginService() {
    return _instance;
  }

  LoginService._getInstance();

  Future<Map<bool,LoginResponse>> login(String email, String password) async {
    print("In login service");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$email:$password'));
    final http.Response response = await http.get("${APIClient.baseURL}me",
        headers: {HttpHeaders.authorizationHeader: basicAuth});
    // print(jsonDecode(response.body).toString());
    if (response.statusCode == 200)
    {
      print("Login successful");
      return {true:LoginResponse.fromJson(jsonDecode(response.body)["data"])};
    }
    else
    {
      print("Login failed");
      return {false:LoginResponse()};
    }
  }
}