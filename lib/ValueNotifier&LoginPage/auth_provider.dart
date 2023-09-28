import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'home_screen.dart';
class AuthProvider with ChangeNotifier{

  bool _isloading = false;
  bool get isloading => _isloading;
  void setLoading(bool loading){
    _isloading = loading;
    notifyListeners();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  void checkLogin(bool login){
    _isLogin = login;
    notifyListeners();
  }

  Login(String email,String password) async{
    setLoading(true);
    try{
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email':email,
            'password':password
          });
      if(response.statusCode==200){
        print("Successfull");
        setLoading(false);
        checkLogin(true);

      }
      else{
        print("Failed");
        setLoading(false);
        checkLogin(false);
      }
    }
    catch(e){
      print(e.toString());
      setLoading(false);
      checkLogin(false);
    }
  }

}