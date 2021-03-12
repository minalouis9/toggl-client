import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggl_client_app/utils/Images.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';

customAppbar(context){
  return AppBar(
    // backgroundColor: Colors.grey[200],
    elevation: 0.0,
    // actionsIconTheme: IconThemeData(color: Colors.black),
    title: SvgPicture.asset(ImportedImages.togglLogo,fit: BoxFit.fitWidth,
      width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3)),
    centerTitle: true,
    actions: [
      IconButton(icon: Icon(Icons.settings), onPressed: (){

      })
    ],
  );
}
