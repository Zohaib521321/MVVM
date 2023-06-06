import 'package:first/MVVM/utils/routes/routes.dart';
import 'package:first/MVVM/utils/routes/routes_name.dart';
import 'package:first/MVVM/view/login_screen.dart';
import 'package:first/MVVM/viewmodel/auth_view_model.dart';
import 'package:first/MVVM/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MVVM_MAIN());
}
class MVVM_MAIN extends StatefulWidget {
  const MVVM_MAIN({Key? key}) : super(key: key);
  @override
  State<MVVM_MAIN> createState() => _MVVM_MAINState();
}
class _MVVM_MAINState extends State<MVVM_MAIN> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=>AuthviewModel()),
      ChangeNotifierProvider(create: (_)=> user_view_model())
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ) ,
    );
  }
}


