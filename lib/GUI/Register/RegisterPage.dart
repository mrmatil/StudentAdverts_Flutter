
import 'dart:math';

import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Common/Singletons/LoginSingleton.dart';
import 'package:StudentAdverts_Mobile/GUI/Login/LoginPage.dart';
import 'package:StudentAdverts_Mobile/Models/UserModel.dart';
import 'package:StudentAdverts_Mobile/Networking/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:StudentAdverts_Mobile/Widgets/LoginWidget.dart';

class RegisterPage extends StatefulWidget{

  RegisterPage();

  @override
  _RegisterState createState() => _RegisterState();

  // Variables:
  final String title = "Register";


}

class _RegisterState extends State<RegisterPage> {
  void changeType(){
    print("TypeChanged");
    Navigator.pop(
      context,
      LoginPage()
    );
  }

  void Authenticate(){
    print("Authentication");
    var loginData = LoginSingleton();
    var userModel = new UserModel();
    userModel.email = loginData.login;
    userModel.password = loginData.password;
    userModel.confirmPassword = loginData.rePassword;
    Authentication authentication = new Authentication(TypeOfAuthentication.register, userModel);
    authentication.getUserData();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
          child: LoginWidget(TypeOfAuthentication.register,"Register",Colors.white,changeType,Authenticate)
      ),
      backgroundColor: Colors.purple,
    );
  }
}