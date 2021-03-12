import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:toggl_client_app/models/TimeEntry.dart';
import 'package:toggl_client_app/models/User.dart';
import 'package:toggl_client_app/models/responses/LoginResponse.dart';
import 'package:toggl_client_app/models/responses/TimeEntryResponse.dart';
import 'package:toggl_client_app/services/APIClient.dart';
import 'package:toggl_client_app/utils/DateTimeFormat.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';
import 'package:toggl_client_app/widgets/ListShimmer.dart';
import "package:collection/collection.dart";

class TimerTab extends StatefulWidget {
  @override
  _TimerTabState createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  List<TimeEntry> _timeEntryList = List();

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  _loadData() async {
    await APIClient()
        .timeEntryService()
        .getTimeEntriesByPeriod(context
        .read<UserProvider>()
        .user
        .apiToken)
        .then((value) {
      if (value.containsKey(true)) {
        setState(() {
          _timeEntryList = value.values.first.timeEntryList;
        });
      }
    });
  }

  _groupEntriesByDate(List<TimeEntry> timeEntryList) {
    var groupByDate =
    groupBy(timeEntryList, (obj) => obj.start.toString().substring(0, 10));
    return ListView.builder(
        itemCount: groupByDate.length,
        itemBuilder: (context, index) {
          int sum = 0;
          groupByDate.values.elementAt(index).forEach((element) {
            sum += element.duration;
          });
          return Column(
            children: [
              Card(
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          groupByDate.keys.elementAt(index),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _printDuration(Duration(seconds: sum)),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: groupByDate.values
                      .elementAt(index)
                      .length,
                  itemBuilder: (context, index2) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  InterfaceUtilities.borderRadiusSmall)),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                padding:
                                EdgeInsets.fromLTRB(16.0, 34.0, 16.0, 42.0),
                                height: 240.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(InterfaceUtilities
                                          .borderRadiusSmall)),
                                  color: Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x4d000000),
                                        offset: Offset(0, -0.5),
                                        blurRadius: 20,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${groupByDate.values
                                            .elementAt(index)
                                            .elementAt(index2)
                                            .description}",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: InterfaceUtilities
                                                .containerPadding)),
                                    Text(
                                        "Start : ${formatDateTime(groupByDate.values
                                            .elementAt(index)
                                            .elementAt(index2)
                                            .start
                                            .toIso8601String())}",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    groupByDate.values
                                        .elementAt(index)
                                        .elementAt(index2)
                                        .end !=
                                        null
                                        ? Text(
                                        "End : ${formatDateTime(groupByDate.values
                                            .elementAt(index)
                                            .elementAt(index2)
                                            .end.toIso8601String())}",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))
                                        : SizedBox(),
                                    Text(
                                        "Duration : ${_printDuration(Duration(
                                            seconds: groupByDate.values
                                                .elementAt(index)
                                                .elementAt(index2)
                                                .duration))}",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                    // Text(groupByDate.values
                                    //     .elementAt(index)
                                    //     .elementAt(index2).pID.toString(),style: TextStyle(fontSize: 17.0,
                                    //     color: Colors.white, fontWeight: FontWeight.w500)),
                                    // Text(groupByDate.values
                                    //     .elementAt(index)
                                    //     .elementAt(index2).wID.toString(),style: TextStyle(fontSize: 17.0,
                                    //     color: Colors.white, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Card(
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(groupByDate.values
                                        .elementAt(index)
                                        .elementAt(index2)
                                        .description),
                                    Text(_printDuration(Duration(
                                        seconds: groupByDate.values
                                            .elementAt(index)
                                            .elementAt(index2)
                                            .duration)))
                                  ],
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
            ],
          );
        });
  }

  _listViewBuilder() {
    if (_timeEntryList.isNotEmpty) {
      // print(_ridesList.length);
      return _groupEntriesByDate(_timeEntryList);
    } else {
      return ListShimmer();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listViewBuilder(),
    );
  }
}
