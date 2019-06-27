import 'package:flutter/material.dart';
import 'package:untitled55/screens/onbording.dart';
import 'package:untitled55/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled55/uatility/app_theme.dart';


void main()async{
  SharedPreferences per = await SharedPreferences.getInstance();
  bool seen = per.getBool('seen');
Widget  _screense ;
  if (seen==null||seen==false){
    //go to home
    _screense = onBoarding();
  }else{
    _screense = HomeScreen();
  }

  runApp(NewsApp(
_screense

  ));
}

class NewsApp extends StatelessWidget {
  Widget _Screens;
  NewsApp(this._Screens);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Screens,
      theme: AppTheme.appthemes, debugShowMaterialGrid: false,

    );
  }
}
