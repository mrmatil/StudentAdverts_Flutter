import 'dart:io';

import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfModification.dart';
import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:dio/dio.dart';

class AdvertModify{

  final String baseUrl = "https://studentadverts.azurewebsites.net/";
  final TypeOfModification typeOfModification;
  final AdvertModel advertModel;
  final String id;
  final Function() callback;

  AdvertModify(this.typeOfModification, this.advertModel, this.callback, this.id);
  void setNewAdvert(){
    print(id);
    switch(typeOfModification){
      case TypeOfModification.modify:{
        _modifyModel();
        break;
      }
      case TypeOfModification.add:{
        _createModel();
        break;
      }
      case TypeOfModification.delete:{
        _deleteModel();
        break;
      }
    }
  }


  void _modifyModel() async{
    String _modifyUrl = "adverts/PutAdvert/"+advertModel.id.toString();
    try{
      var dio = new Dio();
      Response response = await dio.put(baseUrl+_modifyUrl,data: {
        "id": advertModel.id,
        "title": advertModel.title,
        "author": advertModel.author,
        "email": advertModel.email,
        "phone": advertModel.phone,
        "dateAndTime": "2020-05-31T00:29:15.3936609+00:00",
        "description": advertModel.description,
        "price": advertModel.description,
        "picture": "QEA="
      }, options: Options(
          headers: {
            "Authorization":"Bearer "+id
          }
      ));
      print(response);
      callback();
    } catch (e){
      print(e);
    }
  }

  void _createModel() async{
    String createURL = "adverts/PostAdvert";
    try{
      var dio = new Dio();
      Response response = await dio.post(baseUrl+createURL, data: {
        "title": advertModel.title,
        "author": advertModel.author,
        "email": advertModel.email,
        "phone": advertModel.phone,
        "dateAndTime": "2020-05-31T00:29:15.3936609+00:00",
        "description": advertModel.description,
        "price": advertModel.description,
        "picture": "QEA="
      }, options: Options(
          headers: {
            "Authorization":"Bearer "+id
          }
      ));
      print(response);
      callback();
    } catch(e){
      print(e);
    }
  }

  void _deleteModel() async{
    String _deleteURL = "adverts/DeleteAdvert/"+advertModel.id.toString();
    try{
      var dio = new Dio();
      Response response = await dio.delete(baseUrl+_deleteURL, options: Options(
        headers: {
          "Authorization":"Bearer "+id
        }
      ));
      print(response);
      callback();
    } catch (e){
      print(e);
    }
  }


}