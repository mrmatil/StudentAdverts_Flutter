import 'dart:io';

import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Models/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Authentication{

  final TypeOfAuthentication typeOfAuthentication;
  final String baseUrl = "https://studentadverts.azurewebsites.net/";
  final UserModel userModel;
  final Function(bool isError, String response) callback;


  Authentication(this.typeOfAuthentication, this.userModel, this.callback);

  void getUserData() async{

    print("Email" + userModel.email.toString());
    print("Password" + userModel.password.toString() + " " + userModel.confirmPassword.toString());

       switch (typeOfAuthentication){
         case TypeOfAuthentication.login:{
           _login();
           break;
         }

         case TypeOfAuthentication.register:{
           _register();
           break;
         }
       }
  }

  void _login() async{
    String _loginURL = "/token";
    try{
      var dio = new Dio();
      Response response = await dio.post(baseUrl+_loginURL, data: {
        "grant_type":"password",
        "userName":userModel.email.toString(),
        "password":userModel.password.toString()
      }, options: Options(
        contentType: Headers.formUrlEncodedContentType
      ));
      print("Response login:" + response.toString());
      callback(false,response.toString());
    }
    catch (e){
      print("Login Error:" + e.toString());
      callback(true,e.toString());
    }
  }

  void _register() async{
    String _registerURL = "api/Account/Register";
    try{
      var dio = new Dio();
      Response response = await dio.post(baseUrl+_registerURL, data: {
        "Email": userModel.email.toString(),
        "Password": userModel.password.toString(),
        "ConfirmPassword": userModel.confirmPassword.toString()
      });
      print("Response register:"+response.toString());
      _login();
    }
    catch (e){
      print("Register Error:" + e.toString());
      callback(true,e.toString());
    }
  }


}