import 'dart:convert';
import 'dart:io';

import 'package:toggl_client_app/models/responses/TimeEntryResponse.dart';
import 'package:toggl_client_app/services/APIClient.dart';

import 'package:http/http.dart' as http;

class TimeEntryService{
  static final TimeEntryService _instance = TimeEntryService._getInstance();

  factory TimeEntryService() {
    return _instance;
  }

  TimeEntryService._getInstance();

  Future<Map<bool,TimeEntryResponse>> getTimeEntriesByPeriod(apiToken) async {
    print("In time entry service");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));
    final http.Response response = await http.get("${APIClient.baseURL}time_entries?start_date=2021-03-03T00:00:00Z&end_date=2021-03-30T00:00:00Z",
        headers: {HttpHeaders.authorizationHeader: basicAuth});
    print(jsonDecode(response.body).toString());
    if (response.statusCode == 200)
    {
      print("time entry retrieved successful");
      return {true:TimeEntryResponse.fromJson(jsonDecode(response.body))};
    }
    else
    {
      print("time entry retrieved failed");
      return {false:TimeEntryResponse()};
    }
  }

  Future<Map<bool,TimeEntryResponse>> getCurrentTimeEntries(apiToken) async {
    print("In time entry service");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiToken:api_token'));
    final http.Response response = await http.get("${APIClient.baseURL}time_entries/current",
        headers: {HttpHeaders.authorizationHeader: basicAuth});
    print(jsonDecode(response.body).toString());
    if (response.statusCode == 200)
    {
      print("time entry retrieved successful");
      return {true:TimeEntryResponse.fromJson(jsonDecode(response.body))};
    }
    else
    {
      print("time entry retrieved failed");
      return {false:TimeEntryResponse()};
    }
  }

}