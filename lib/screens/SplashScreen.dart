import 'package:flutter/material.dart';
import 'package:toggl_client_app/models/User.dart';
import 'package:toggl_client_app/screens/Home.dart';
import 'package:toggl_client_app/screens/LandingScreen.dart';
import 'package:toggl_client_app/utils/LocalStorage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _loadData() async {
    await LocalStorage().getRememberUser().then((value) async {
      if(value != null){
        await LocalStorage().getUser().then((user){
          if(user != null){
            context.read<UserProvider>().onNewUser(user);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return HomeScreen();}), (route) => false);
          }else{
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return LandingScreen();}), (route) => false);
          }
        });
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return LandingScreen();}), (route) => false);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
