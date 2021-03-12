import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toggl_client_app/models/User.dart';
import 'package:toggl_client_app/screens/Login.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';
import 'package:toggl_client_app/utils/LocalStorage.dart';
import 'package:toggl_client_app/utils/Strings.dart';
import 'package:toggl_client_app/utils/Images.dart';
import 'package:toggl_client_app/widgets/Buttons.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List _imagesList = [
    ImportedImages.carouselTime,
    ImportedImages.carouselReports
  ];

  @override
  Widget build(BuildContext context) {
    double height = InterfaceUtilities.getPercentageOfScreenHeight(context, 0.8),
        width = InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0);

    _buildCarousel(){
      return CarouselSlider.builder(
          itemCount: _imagesList.length,
          itemBuilder: (context,index,_) => Container(
            alignment: Alignment.center,
            width: width,
            child: Image.asset(_imagesList.elementAt(index),fit: BoxFit.fill,height: height, width: width,),
          ),
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlay: true,
          )
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
          child: Center(
            child: Column(
              children: [
                _buildCarousel(),
                Padding(padding: const EdgeInsets.symmetric(vertical: InterfaceUtilities.containerPadding)),
                CustomButton(label: LandingScreenStrings.signInWithEmailButton,color: Color(0xff754DAD) ,width: InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0) ,onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
