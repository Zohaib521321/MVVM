import 'package:first/MVVM/viewmodel/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class user_view_model with ChangeNotifier{
Future<bool> saveUser(UserModel user)async{
final shared_preference=await SharedPreferences.getInstance();
shared_preference.setString("token", user.token.toString());
notifyListeners();
return true;
}
Future<UserModel> getuser()async{
  final shared_preference=await SharedPreferences.getInstance();
  final String? token=shared_preference.getString("token");
  return UserModel(
    token:token
  );
}
Future<bool> remove()async{
  final shared_preference=await SharedPreferences.getInstance();
 return shared_preference.clear();
}
}