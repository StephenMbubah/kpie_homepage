import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_homepage/service/login_service.dart';

import '../homepage4_ui.dart';


final apiProviderVM = ChangeNotifierProvider.autoDispose((ref) => ApiProvider());
class ApiProvider extends ChangeNotifier{
  final loginService = LoginService();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;

  Future<dynamic> loginUser(context)async{


    try{
    await loginService.loginUser(context,username: _userNameController.text, password: _passwordController.text).then((value){
      if(value != null){
        final decodedResponse = jsonDecode(value.toString());
        debugPrint(decodedResponse);
        if(decodedResponse['api_status'] == '200'){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomePage()));
          print('SUCCESS');
          debugPrint(value.toString());
        }
        // debugPrint(value.toString());
      }
    });
    }
    catch(e,s){
      print('ERROR');
      print(e.toString());
    }
  }
}