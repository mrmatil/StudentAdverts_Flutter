import 'dart:convert';

import 'package:StudentAdverts_Mobile/Models/AdvertJSON.dart';
import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:dio/dio.dart';

class Adverts{

  final String baseUrl = "https://studentadverts.azurewebsites.net/";
  final String textForSearch;


  Adverts(this.textForSearch);

  Future<List<AdvertModel>>  getAdverts() async{
    if(textForSearch == ""){
      return _getAllAdverts();
    } else{
      return _getAdvertsWithText();
    }
  }

  Future<List<AdvertModel>>  _getAllAdverts() async{
    String _allAdvertsURL = "adverts/GetAdverts";
    try{
      var dio = new Dio();
      Response response = await dio.get(baseUrl+_allAdvertsURL,
          options: Options(
          responseType: ResponseType.plain
      ));
      return this.parses(response);
    } catch(e){

    }


  }

  Future<List<AdvertModel>>  _getAdvertsWithText() async{
    String _advertsWithTextURL = "adverts/GetAdvert?title="+textForSearch+"";
    try{
      var dio = new Dio();
      Response response = await dio.get(baseUrl+_advertsWithTextURL, options: Options(
          responseType: ResponseType.plain
      ));
      return this.parses(response);
    } catch (e){

    }
  }

  List<AdvertModel> parses(Response text) {
    print("Parsing Text" + text.toString());
    try {
      List<dynamic> list = json.decode(text.toString());
      List<AdvertModel> data = new List();
      for (var i = 0; i < list.length; i++) {
        var temp = new AdvertModel();
        temp.id = list[i]["id"];
        temp.title = list[i]["title"];
        temp.author = list[i]["author"];
        temp.email = list[i]["email"];
        temp.phone = list[i]["phone"];
        temp.dateTime = list[i]["dateTime"];
        temp.description = list[i]["description"];
        temp.price = list[i]["price"];
        data.add(temp);
      }
      return data;
    } catch (e){
      print(e);
    }
  }


}