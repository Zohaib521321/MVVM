import 'package:first/MVVM/utils/routes/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:first/MVVM/repositry/auth_repositry.dart';
import 'package:flutter/material.dart';
import '../utils/routes/routes_name.dart';
class AuthviewModel with ChangeNotifier {
  final _Myrepo=auth_repository();
  bool _loading = false;
  bool get loading => _loading ;
  bool _signuploading = false;
  bool get signuploading =>_signuploading;
  setLoading (bool value) {
    _loading = value;
    notifyListeners();
  }
  setsignupLoading (bool value) {
    _signuploading=value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data,BuildContext context) async{
    setLoading(true);
_Myrepo.loginApi(data).then((value) {
  setLoading(false);
  Navigator.pushNamed(context, RoutesName.home);
  utils.flushBarErrorMessage("Login SuccessFull",context);
  if (kDebugMode){
    print(value.toString());
  }
}).onError((error, stackTrace) {
  setLoading(false);
  if (kDebugMode) {
    utils.flushBarErrorMessage(error.toString(), context);
    print(error.toString());
  }
});
  }
  Future<void> signupApi(dynamic data,BuildContext context) async{
    setsignupLoading(true);
    _Myrepo.loginApi(data).then((value) {
      setsignupLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      utils.flushBarErrorMessage("Signup SuccessFull", context);
      if (kDebugMode) {
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setsignupLoading(false);
      if (kDebugMode) {
        utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }
}