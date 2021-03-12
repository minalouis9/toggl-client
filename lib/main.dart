import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggl_client_app/models/User.dart';
import 'package:toggl_client_app/models/responses/LoginResponse.dart';
import 'package:toggl_client_app/screens/LandingScreen.dart';
import 'package:toggl_client_app/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff754DAD),
          // primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}