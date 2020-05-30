
import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Common/Singletons/LoginSingleton.dart';
import 'package:StudentAdverts_Mobile/GUI/Register/RegisterPage.dart';
import 'package:StudentAdverts_Mobile/Models/UserModel.dart';
import 'package:StudentAdverts_Mobile/Networking/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:StudentAdverts_Mobile/Widgets/LoginWidget.dart';

class LoginPage extends StatefulWidget{

  LoginPage();

  @override
  _LoginState createState() => _LoginState();

  // Variables:
  final String title = "Login";


}

class _LoginState extends State<LoginPage> {

  void changeType(){
    print("TypeChanged");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> new RegisterPage()),
    );
  }

  void Authenticate(){
    print("Authentication");
    var loginData = LoginSingleton();
    var userModel = new UserModel();
    userModel.email = loginData.login;
    userModel.password = loginData.password;
    Authentication authentication = new Authentication(TypeOfAuthentication.login, userModel);
    authentication.getUserData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: LoginWidget(TypeOfAuthentication.login,"Login",Colors.white,changeType,Authenticate)
      ),
      backgroundColor: Colors.purple,
    );
  }
}