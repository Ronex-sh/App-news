import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled55/uatility/api.dart';
import 'package:untitled55/models/post.dart';
import 'dart:convert'as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthenAPI{

  Future<bool> Login(email,password)async{

    String AuthApi = base_api + auth_api;
    Map<String,String> headers={
      'Accept':'application/json',
      'Content-Type':'application/x-www-form-urlencoded',

    };
    Map<String,String> body={
      "email" : email,
      "password" : password

    };
    var response = await http.post(AuthApi, headers: headers , body: body );

    if( response.statusCode == 200 ){
      try{
        var jsonData = jsonDecode( response.body);
        var data = jsonData['data'];
        var token = data['token'];
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        return true;
      }catch( Exception ){
        return false;
      }

    }

    return false;
  }

}