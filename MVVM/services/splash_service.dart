import 'package:first/MVVM/utils/routes/routes_name.dart';
import 'package:first/MVVM/viewmodel/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../viewmodel/user_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => user_view_model().getuser();
  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) {
      if (value.token == null || value.token == '') {
        Navigator.pushNamed(context, RoutesName.login);
      }
      else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}