import 'dart:async';
import 'package:first/MVVM/services/splash_service.dart';
import 'package:first/MVVM/utils/routes/routes_name.dart';
import 'package:first/MVVM/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
class splash_view extends StatefulWidget {
  const splash_view({Key? key}) : super(key: key);
  @override
  State<splash_view> createState() => _splash_viewState();
}
class _splash_viewState extends State<splash_view> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
SplashServices().checkAuthentication(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
