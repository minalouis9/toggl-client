import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(context, message) {
  Toast.show(message, context,
      duration: 4,
      gravity: Toast.BOTTOM,
      backgroundColor: Theme.of(context).primaryColor,
      textColor: Colors.white,
      border: Border.all(color: Colors.white));
}