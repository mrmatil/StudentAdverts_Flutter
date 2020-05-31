import 'package:StudentAdverts_Mobile/Models/AdvertModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertWidget extends StatelessWidget{

  final Color backgroundColor;
  final Color fontColor;
  final AdvertModel advertModel;
  final String id;
  final Function(int id) detailsCallback;


  AdvertWidget(
      this.backgroundColor,
      this.fontColor,
      this.advertModel,
      this.id,
      this.detailsCallback);

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: new BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)
              )]
      ),
//      height: 250,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(advertModel.title, textAlign: TextAlign.center, style: TextStyle(
            color: fontColor
          ),),
          Text(advertModel.description, textAlign: TextAlign.left, style: TextStyle(
            color: fontColor
          ),),
          Text(advertModel.price.toString() + " zł/h", textAlign: TextAlign.right, style: TextStyle(
            color: fontColor
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                detailsCallback(advertModel.id);
                },
                textColor: fontColor,
                child: Text("Details"),
              )
            ],)

        ],
      ),
    );
  }
}