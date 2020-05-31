import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfModification.dart';
import 'package:StudentAdverts_Mobile/GUI/Details/DetailsPage.dart';
import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:StudentAdverts_Mobile/Networking/Adverts.dart';
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
  Future<List<AdvertModel>> widgets;
  List<AdvertModel> advertModels;
  String searchedText = "";



  _AdvertsState(this.id, this.email){
    getAdverts("");
  }

  void getAdverts(String searchedText){
    Adverts adverts = new Adverts(searchedText);
    var x = adverts.getAdverts();
    widgets = x;
  }


  void detailsTapped(int id) {
    var x = AdvertModel();
    for (var t=0; t<advertModels.length;t++){
      if(advertModels[t].id == id){
        x = advertModels[t];
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>new DetailsPage(this.id, email, x, TypeOfModification.modify)));
  }



  @override
  Widget build(BuildContext context) {

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
              title: Text("Add Adverts"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> new DetailsPage(id, email, new AdvertModel(), TypeOfModification.add)));
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
        child: FutureBuilder<List<AdvertModel>>(
          future: widgets,
          builder: (context, snapshot){

            TableRow searchRow = TableRow(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search from adverts",
                      labelText: "Search: "
                  ),
                  onChanged: (String value){
                    setState(() {
                      getAdverts(value);
                    });
                  },
                ),
            ]
            );

            if(snapshot.hasData){
              advertModels = snapshot.data;
              List<TableRow> rows = new List<TableRow>();
              rows.add(searchRow);
              for(var z=0;z<snapshot.data.length;z++){
                rows.add(TableRow(
                  children: [
                   AdvertWidget(Colors.purple,Colors.white,snapshot.data[z],id,detailsTapped)
                  ]
                ));
              }

              return SingleChildScrollView(
                child: Table(
                  children: rows,
                ),
              );
            } else{
              return Text("Downloading...");
            }
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}