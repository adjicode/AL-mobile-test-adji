import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_adji/components/component_colors.dart';

class ComponentAlerts{
  static showFlushbarFailed(BuildContext context, String message) {
    Flushbar(
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
      reverseAnimationCurve: Curves.easeInSine,
      backgroundColor: Colors.orange,
      message: message != null ? message : 'Silahkan hubungi admin',
      mainButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close, color: Colors.white),
      ),
    )..show(context);
  }

  static showFlushbarSuccess(BuildContext context, String message) {
    Flushbar(
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
      reverseAnimationCurve: Curves.easeInSine,
      backgroundColor: ComponentColors.bodyColorGreen,
      message: message != null ? message : 'Silahkan hubungi admin',
      mainButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close, color: Colors.white),
      ),
    )..show(context);
  }

}