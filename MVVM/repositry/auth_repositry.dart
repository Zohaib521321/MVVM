import 'dart:convert';

import 'package:first/MVVM/data/network/BaseApiservice.dart';
import 'package:first/MVVM/data/network/NetworkApiService.dart';
import '../resources/app_url.dart';
class auth_repository{
BaseApi _apiservice=Network();
Future<dynamic> loginApi(dynamic data) async{
  try{
dynamic response=await _apiservice.getPostApiResponse(Url.Loginendpoint, data);
final responseBody = jsonDecode(response.body);
print(responseBody);
final token = responseBody['token'];
print(token);
return token;
  }
  catch(e){
throw e;
  }
}
Future<dynamic> signupApi(dynamic data) async{
  try{
    dynamic response=await _apiservice.getPostApiResponse(Url.register, data);
 return response;
  }
  catch(e){
    throw e;
  }
}
}