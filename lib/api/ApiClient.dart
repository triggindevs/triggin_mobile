import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triggin_app/models/LoginResponse.dart';
import 'package:triggin_app/webservices/api_services.dart';

class ApiClient {

  // static Future<LoginResponse> signUp(BuildContext buildContext) async {
  //   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // String? token = sharedPreferences.getString(SharedPrefs.TOKEN);
  //   // var reqHeader = {
  //   //   "Content-Type": "application/json",
  //   //   "Authorization": "Bearer $token",
  //   // };
  //   // post api req body
  //   // "email": "gayle1@gmail.com",
  //   // "name": "Namdev Gavle buyer",
  //   // "phoneNumber": "9676889831",
  //   // "password": "abcd123456"
  //
  //   var reqMain =
  //   jsonEncode({"email": "", "name": "", "phoneNumber": "", "password": ""});
  //
  //   print('request body: $reqMain');
  //
  //   // var response = await http.put(APIs.updateCrosstrainedData,body: reqMain);
  //   // print('response.body: ${response.body}');
  //   // var _data;
  //   // try {
  //   //   _data = json.decode(response.body);
  //   // } catch(Exception) {
  //   //   Navigator.pushNamed(buildContext, AppRoutes.signin);
  //   //   return null;
  //   // }
  // }
}