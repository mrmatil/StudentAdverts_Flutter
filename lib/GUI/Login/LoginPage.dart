
import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Common/Singletons/LoginSingleton.dart';
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
  }

  void Authenticate(){
    print("Authentication");
    var loginData = LoginSingleton();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: LoginWidget(TypeOfAuthentication.register,"Login",Colors.white,changeType,Authenticate)
      ),
      backgroundColor: Colors.purple,
    );
  }
}