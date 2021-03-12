import 'package:toggl_client_app/services/ProjectService.dart';
import 'package:toggl_client_app/services/TimeEntryService.dart';

import 'LoginService.dart';

class APIClient{
  static final String baseURL = "https://www.toggl.com/api/v8/";
  static final APIClient _instance = APIClient._getInstance();
  static final LoginService _loginService = LoginService();
  static final TimeEntryService _timeEntryService = TimeEntryService();
  static final ProjectService _projectService = ProjectService();

  factory APIClient(){
    return _instance;
  }

  APIClient._getInstance();

  LoginService loginService(){
    return _loginService;
  }

  TimeEntryService timeEntryService(){
    return _timeEntryService;
  }

  ProjectService projectService(){
    return _projectService;
  }
}