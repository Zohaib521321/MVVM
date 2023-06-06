import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:first/MVVM/data/Appexception.dart';
import 'BaseApiservice.dart';
class Network extends BaseApi {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jasonresponse;
    try{
      final responce = await http.get(Uri.parse(url)).timeout(
          Duration(seconds: 10));
      jasonresponse = returnResponse(responce);
    }
    on SocketException {
      throw fetchDataException("No Internet Connection");
    }
    return jasonresponse;
  }
  @override
  Future<http.Response> getPostApiResponse(String url, dynamic data) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw fetchDataException("No Internet Connection");
    }
  }
  http.Response returnResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response; // return the response object
    } else {
      throw fetchDataException(
          "Error occurred while connecting with server: ${response.body
              .toString()}");
    }
  }
}

