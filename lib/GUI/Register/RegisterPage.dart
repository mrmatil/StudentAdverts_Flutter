
import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Common/Singletons/LoginSingleton.dart';
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
  }

  void Authenticate(){
    print("Authentication");
    var loginData = LoginSingleton();

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