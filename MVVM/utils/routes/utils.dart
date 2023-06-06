import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
class utils{
  //We will use them after making some mvvm architecture
static toastMessage(String message){
  Fluttertoast.showToast(msg: message,
  );
}
static void flushBarErrorMessage(String message, BuildContext context) {
 showFlushbar(context: context,
     flushbar:Flushbar(
message: message,
       forwardAnimationCurve: Curves.decelerate,
       backgroundColor: Colors.red,
       padding: EdgeInsets.all(18.0),
       reverseAnimationCurve: Curves.easeInOut,
       duration: Duration(seconds: 5),
     )..show(context));
}
static snackBar (String message, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(message)) // SnackBar
  );
}
}