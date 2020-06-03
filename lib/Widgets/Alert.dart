import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleAlert{
  BuildContext context1;
  String title;
  String content;


  SimpleAlert(this.context1, this.title, this.content);

  void showSimpleDialog() {
    // flutter defined function
    showDialog(
      context: context1,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}