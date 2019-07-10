import 'package:shared_preferences/shared_preferences.dart';



Future<bool>isLogIn()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();{
    bool isLoggedin = sharedPreferences.getBool('isLoggedin');
    if(isLoggedin ==null || isLoggedin==false){
      return false;
    }
    return true;

  }

}