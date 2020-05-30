import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:StudentAdverts_Mobile/Models/UserModel.dart';
import 'package:dio/dio.dart';

class Authentication{

  final TypeOfAuthentication typeOfAuthentication;
  final String baseUrl = "https://studentadverts.azurewebsites.net/";
  final UserModel userModel;


  Authentication(this.typeOfAuthentication, this.userModel);

  void getUserData() async{
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
      print(response);
    }
    catch (e){
      print(e);
    }
  }


}