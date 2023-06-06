//We will impliment every screen later
import 'package:first/MVVM/view/Home_screen.dart';
import 'package:first/MVVM/view/login_screen.dart';
import 'package:first/MVVM/view/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/splash_view.dart';
import 'routes_name.dart';
class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context)=>splash_view());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=>home_screen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context)=>login());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context)=>SignupView());
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(child: Text("No Rote defined"),),
          );
        });
    }
  }
}