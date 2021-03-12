import 'package:flutter/material.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final TextStyle textStyle;
  final Color color;
  final double height, width;

  CustomButton({this.label, this.onPressed, this.textStyle:const TextStyle(color: Colors.white, fontSize: 17.0),this.color,
    this.height: 40.0,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      height: height,
      minWidth: width,
      color: color,
      elevation: InterfaceUtilities.elevation,
      shape: RoundedRectangleBorder(
          side: BorderSide(color:color, width: 2.0),
          borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadiusExtraSmall)
      ),
      child: Text(label,style: textStyle,),
    );
  }
}
