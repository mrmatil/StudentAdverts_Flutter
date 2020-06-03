import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfModification.dart';
import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:StudentAdverts_Mobile/Networking/AdvertModify.dart';
import 'package:StudentAdverts_Mobile/Widgets/Alert.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget{


  final String id;
  final String email;
  final AdvertModel advertModel;
  final TypeOfModification modification;


  DetailsPage(this.id, this.email, this.advertModel, this.modification);

  @override
  _DetailsPage createState() => _DetailsPage(id, email, advertModel, modification);

}

class _DetailsPage extends State<DetailsPage> {

  final String id;
  final String email;
  final AdvertModel advertModel;
  final TypeOfModification modification;

  AdvertModel newAdvertModel = new AdvertModel();
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _phoneController = TextEditingController();
  var _priceController = TextEditingController();

  _DetailsPage(this.id, this.email, this.advertModel, this.modification){
    newAdvertModel = advertModel;
    if(modification == TypeOfModification.modify){
      //TODO: ADD Checking if user is authorised
      _titleController.text = advertModel.title;
      _descriptionController.text = advertModel.description;
      _phoneController.text = advertModel.phone.toString();
      _priceController.text = advertModel.price.toString();
    } else{
      advertModel.author = email;
    }
  }

  void callback(){
    Navigator.of(context).pop();
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
              title: Text("See all adverts"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();


              },
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();

              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: "Please type Title",
                  labelText: "title: "
              ),
              onChanged: (String Value) {
                newAdvertModel.title = Value;
              },
              controller: _titleController,
              ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: "Please type Description",
                  labelText: "description: "
              ),
              onChanged: (String Value) {
                newAdvertModel.description = Value;
              },
              controller: _descriptionController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: "Please type Phone",
                  labelText: "Phone: "
              ),
              onChanged: (String Value) {
                try{
                  newAdvertModel.phone = Value as int;
                } catch (e){
                  SimpleAlert alert = new SimpleAlert(context, "Error", "Phone value is not valid");
                  alert.showSimpleDialog();
                }
              },
              controller: _phoneController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.attach_money),
                  hintText: "Please type Price",
                  labelText: "Price: "
              ),
              onChanged: (String Value) {
                try{
                  newAdvertModel.price = Value as double;
                } catch (e){
                  SimpleAlert alert = new SimpleAlert(context, "Error", "Price value is not valid");
                  alert.showSimpleDialog();
                }
              },
              controller: _priceController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple,
                  child: modification==TypeOfModification.modify? Text("Update"):Text("Add"),
                  onPressed: (){
                    if(advertModel.email==email){
                      AdvertModify network = new AdvertModify(modification, newAdvertModel, callback, id);
                      network.setNewAdvert();
                    } else{
                      SimpleAlert alert = new SimpleAlert(context, "Error", "You are not eligible to change this advert");
                      alert.showSimpleDialog();
                    }

                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple,
                  child: modification==TypeOfModification.modify? Text("Delete"):Text("Cancel"),
                  onPressed: (){
                    if(advertModel.email == email){
                      if(modification == TypeOfModification.add){
                        Navigator.of(context).pop();
                      } else{
                        AdvertModify network = new AdvertModify(TypeOfModification.delete, newAdvertModel, callback, id);
                        network.setNewAdvert();
                      }
                    } else{
                      SimpleAlert alert = new SimpleAlert(context, "Error", "You are not eligible to delete this advert");
                      alert.showSimpleDialog();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}