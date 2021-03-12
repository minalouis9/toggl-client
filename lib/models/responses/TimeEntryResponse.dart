import 'package:toggl_client_app/models/TimeEntry.dart';

class TimeEntryResponse{
  List<TimeEntry> timeEntryList;

  TimeEntryResponse({this.timeEntryList});

  factory TimeEntryResponse.fromJson(List<dynamic> list){
    List<TimeEntry> timeList;
    if (list != null)
      timeList = list.map((e) => TimeEntry.fromJson(e)).toList();
    else
      timeList = List();

    return TimeEntryResponse(
      timeEntryList: timeList
    );
  }
}