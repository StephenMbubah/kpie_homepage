import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class LoginService  {

  final client = http.Client();
  Future<dynamic> loginUser(context,{required String username,required String password}){
    return http.post(
        Uri.parse('https://fashionbiz.org/api/auth'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body:jsonEncode({
          'server_key':'1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744',
          'username': username,
          'password': password,
          'device_type':'phone'
        }));
  }

}