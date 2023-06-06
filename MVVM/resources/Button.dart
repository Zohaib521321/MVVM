import 'package:flutter/material.dart';
import 'color.dart'; //we impliment it in next example
class Rounded_button extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpressed;
   Rounded_button({required this.title,required this.onpressed,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container (
        height: 40,
        width: 200,
        decoration: BoxDecoration (
            color: AppColor.btnColor,
            borderRadius: BorderRadius.circular (10)
        ), // BoxDecoration
        child: Center (
            child:loading?const CircularProgressIndicator(backgroundColor: AppColor.white,): Text (title,
              style:const TextStyle(color: AppColor.white),)), // Text, Center
      ), // Container
    ); // InkWell
  }
}
