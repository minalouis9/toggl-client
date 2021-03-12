import 'package:flutter/material.dart';
import 'package:toggl_client_app/screens/tabs/CalenderTab.dart';
import 'package:toggl_client_app/screens/tabs/ReportsTab.dart';
import 'package:toggl_client_app/screens/tabs/TimerTab.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';
import 'package:toggl_client_app/widgets/Appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _tabs = [TimerTab(), ReportsTab(), CalenderTab()];

    return Scaffold(
      appBar: customAppbar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
          child: _tabs[_selectedTabIndex],
        ),
      ),
      bottomNavigationBar:Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.75),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          // border: Border.all(color: CustomColors.logoBackground),
          // gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, stops: [0, 0.8], colors: [CustomColors.logoBackground,Colors.black])
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent.withOpacity(0.0),
          selectedLabelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
          selectedItemColor: Color(0xff3C2261),
          unselectedItemColor: Colors.grey[200],
          currentIndex: _selectedTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index){
            setState(() {
              _selectedTabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "",
              activeIcon: Icon(Icons.timer, size: 30.0,),
              icon: Icon(Icons.timer),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: Icon(Icons.analytics_outlined, size: 30.0,),
              icon: Icon(Icons.analytics_outlined,),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: Icon(Icons.calendar_today_outlined, size: 30.0,),
              icon: Icon(Icons.calendar_today_outlined,),
            )
          ],
        ),
      ),
    );
  }
}
