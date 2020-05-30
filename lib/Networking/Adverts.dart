import 'dart:convert';

import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:dio/dio.dart';

class Adverts{

  final String baseUrl = "https://studentadverts.azurewebsites.net/";
  final String textForSearch;
  final Function(List<AdvertModel>) callback;


  Adverts(this.textForSearch, this.callback);

  void getAdverts() async{
    if(textForSearch == ""){
      _getAllAdverts();
    } else{
      _getAdvertsWithText();
    }
  }

  void _getAllAdverts() async{
    String _allAdvertsURL = "adverts/GetAdverts";
    try{
      var dio = new Dio();
      Response response = await dio.get(baseUrl+_allAdvertsURL);
      this.parse(response.toString());
    } catch(e){

    }


  }

  void _getAdvertsWithText() async{
    String _advertsWithTextURL = "adverts/GetAdvert?title={"+textForSearch+"}";
    try{
      var dio = new Dio();
      Response response = await dio.get(baseUrl+_advertsWithTextURL);
      this.parse(response.toString());
    } catch (e){

    }

  void parse(String text) async{
    List<dynamic> list= json.decode(text.toString());
    List<AdvertModel> data = new List();
    for (var i=0; i<list.length; i++){

    }
  }

  }

}