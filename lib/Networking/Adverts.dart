import 'dart:convert';

import 'package:StudentAdverts_Mobile/Models/AdvertJSON.dart';
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
      Response response = await dio.get(baseUrl+_allAdvertsURL,
          options: Options(
          contentType: Headers.jsonContentType
      ));
      print("Get All Adverts Passed");
      print(response);
      this.parses(response);
    } catch(e){

    }


  }

  void _getAdvertsWithText() async{
    String _advertsWithTextURL = "adverts/GetAdvert?title={"+textForSearch+"}";
    try{
      var dio = new Dio();
      Response response = await dio.get(baseUrl+_advertsWithTextURL);
      print("Get Text Adverts Passed");
      this.parses(response);
    } catch (e){

    }
  }

  void parses(Response text) {
    print("Parsing Text" + text.toString());
    var x = fixString(text);
//    var dupa = '[     {         "id": 1,         "title": "Maskotka rumcajs",         "author": "tester@tester.tester",         "email": null,         "phone": 823657853,         "dateAndTime": "2020-05-15T16:39:19",         "description": "Bardzo szybka maskotka",         "price": null,         "picture": null     },     {         "id": 2,         "title": "Sprzedam Opla",         "author": "timax2@vp.pl",         "email": null,         "phone": 823123123,         "dateAndTime": "2020-05-16T16:39:19",         "description": "Sprzedam Opla tanio. Przebieg i cena do ustalenia. Rocznik na oko 2007. Lekko stukniety ale tak to bez wypadkowy. Posiada Niemieckie blachy. Niemiec plakal jak oddawal. Taniej nie znajdziesz.",         "price": null,         "picture": null     },     {         "id": 4,         "title": "Testowanie dodawania 10",         "author": "cococo@co.co",         "email": "zenonn@martyniuk.pl",         "phone": 842998723,         "dateAndTime": "2020-05-26T14:52:42",         "description": "Przez twe oczy zielone",         "price": null,         "picture": null     },     {         "id": 5,         "title": "ffdsfsd",         "author": "test@test.pl",         "email": "dfsdfsdf@dffd.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T17:33:46",         "description": "fghjkl",         "price": null,         "picture": null     },     {         "id": 7,         "title": "tyt",         "author": "123@wp.pl",         "email": "dasd@wp.pl",         "phone": 123123123,         "dateAndTime": "2020-05-26T19:00:09",         "description": "gfd",         "price": 1.00,         "picture": null     },     {         "id": 8,         "title": "tyt",         "author": "123@wp.pl",         "email": "dasd@wp.pl",         "phone": 123123123,         "dateAndTime": "2020-05-26T19:02:00",         "description": "fds",         "price": 1.00,         "picture": null     },     {         "id": 9,         "title": "tyt",         "author": "123@wp.pl",         "email": "dasd@wp.pl",         "phone": 123123123,         "dateAndTime": "2020-05-26T19:03:42",         "description": "3443",         "price": 2137.00,         "picture": null     },     {         "id": 10,         "title": "Test",         "author": "test@test1.pl",         "email": "test@test.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:07:07",         "description": "JPIIGMD",         "price": 2137.00,         "picture": null     },     {         "id": 11,         "title": "Test1",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:08:55",         "description": "1234567",         "price": 2134.00,         "picture": null     },     {         "id": 12,         "title": "Test2",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:10:20",         "description": "123456789",         "price": 2137.00,         "picture": null     },     {         "id": 13,         "title": "Test7",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:25:06",         "description": "1234",         "price": 1234.00,         "picture": null     },     {         "id": 14,         "title": "Maskotka rumcajs",         "author": "cococo@co.co",         "email": null,         "phone": 823657853,         "dateAndTime": "2020-05-15T16:39:19",         "description": "Bardzo szybka maskotka",         "price": null,         "picture": "dhjniuawyiu2hiudfyiu92hyiuf89u23hijkuf89yu23hijnvyi8"     },     {         "id": 15,         "title": "Maskotka rumcajs",         "author": "cococo@co.co",         "email": null,         "phone": 823657853,         "dateAndTime": "2020-05-15T16:39:19",         "description": "Bardzo szybka maskotka",         "price": null,         "picture": "dhjniuawyiu2hiudfyiu92hyiuf89uefeffefefs"     },     {         "id": 16,         "title": "Test8",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:33:21",         "description": "kfhhdfsghjfsd",         "price": 1234.00,         "picture": null     },     {         "id": 17,         "title": "testBinary",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:44:38",         "description": "1234",         "price": 123.00,         "picture": null     },     {         "id": 18,         "title": "Test10",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T19:56:39",         "description": "123",         "price": 12.00,         "picture": null     },     {         "id": 19,         "title": "Test11",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T20:00:02",         "description": "12345678",         "price": 12.00,         "picture": null     },     {         "id": 20,         "title": "Test12",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T20:01:03",         "description": "123",         "price": 12.00,         "picture": null     },     {         "id": 21,         "title": "Test13",         "author": "test@test1.pl",         "email": "test@test1.pl",         "phone": 123456789,         "dateAndTime": "2020-05-26T20:02:24",         "description": "test",         "price": 12.00,         "picture": null     },     {         "id": 22,         "title": "Testowy",         "author": "test@wp.pl",         "email": "pirinparug@gmail.com",         "phone": 312123123,         "dateAndTime": "2020-05-28T16:07:41",         "description": "dd",         "price": 1.00,         "picture": null     },     {         "id": 23,         "title": "Matematyka",         "author": "test@wp.pl",         "email": "czarek.witecki@wp.pl",         "phone": 331666111,         "dateAndTime": "2020-05-28T18:07:51",         "description": "Oferuje korepetycje z matematyki na poziomie gimnazjalnym. ",         "price": 50.00,         "picture": null     } ]';
    try {
      List<dynamic> list = json.decode(x.toString());
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
      print("Parsed text " + data[0].title.toString());
      callback(data);
    } catch (e){
      print(e);
    }
  }

  String fixString(Response text){
    var x = text.toString();
    x = x.replaceAll('id', '"id"');
    x = x.replaceAll('title', '"title"');
    x = x.replaceAll('author', '"author"');
    x = x.replaceAll('email', '"email"');
    x = x.replaceAll('phone', '"phone"');
    x = x.replaceAll('dateAndTime', '"dateAndTime"');
    x = x.replaceAll('description', '"description"');
    x = x.replaceAll('price', '"price"');
    x = x.replaceAll('picture', '"picture"');
    return x;
  }

}