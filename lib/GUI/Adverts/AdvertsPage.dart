import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:StudentAdverts_Mobile/Widgets/AdvertWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertsPage extends StatefulWidget{

  AdvertsPage(this.id, this.email);


  @override
  _AdvertsState createState() => _AdvertsState(id, email);

  //variables:
  final String id;
  final String email;

}

class _AdvertsState extends State<AdvertsPage>{

  final String id;
  final String email;

  List<AdvertModel> list;

  _AdvertsState(this.id, this.email){
    getAdverts("");
  }

  void getAdverts(String searchedText){

  }

  void detailsTapped(int id) {

  }


  @override
  Widget build(BuildContext context) {

    var x = AdvertModel();
    x.id = 123;
    x.title = "DUPA";
    x.description = "DUPA1";
    x.price = 2137;

    return Scaffold(
      appBar: AppBar(
        title: Text("Adverts"),
        backgroundColor: Colors.grey,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              accountName: Text(email, style: TextStyle(
                color: Colors.purple
              ),),
              accountEmail: Text(email, style: TextStyle(
                color: Colors.purple
              ),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  email.substring(0,1)
                ),
              ),
            ),
            ListTile(
              title: Text("My Adverts"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();

              },
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: Center(
        child: AdvertWidget(Colors.purple,Colors.white,x,"1234",detailsTapped),
      ),
      backgroundColor: Colors.white,
    );
  }
}