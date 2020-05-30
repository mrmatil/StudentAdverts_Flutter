import 'package:StudentAdverts_Mobile/Common/Enumerations/TypeOfAuthentication.dart';
import 'package:flutter/material.dart';


class LoginWidget extends StatelessWidget{
  final TypeOfAuthentication type;
  final String title;
  final Color mainColor;
  final Function changeType;
  final Function(String email, String password, String rePassword) authenticate;
  String _typedEmail;
  String _typedPassword;
  String _reTypedPassword;

  LoginWidget(this.type,
      this.title,
      this.mainColor,
      this.changeType,
      this.authenticate);

  _authenticate(){
  if( type == TypeOfAuthentication.register){
    authenticate(_typedEmail,_typedPassword,_reTypedPassword);
  }else{
    authenticate(_typedEmail,_typedPassword,"");
  }
  }


  Widget build(BuildContext buildContext){

    TextFormField retypePassword = new TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.vpn_key),
          hintText: "Please re-type your password",
          labelText: "Confirm your password:",
      ),
      validator: (String value){
        //TODO: Make any validator XD
        return null;
      },
      onChanged: (String value){
        _reTypedPassword = value;
      },
    );


    return Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: new BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3)
            )
          ]
        ),
        height: 300,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Please type your E-mail",
                    labelText: "E-mail: "
                ),
                validator: (String value){
                  //TODO: Make better validator
                  return value.contains("@") ? null : "It's not valid e-mail";
                },
                onChanged: (String value){
                  _typedEmail = value;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: "Please type your password",
                    labelText: "Password: "
                ),
                validator: (String value){
                  //TODO: Make any validator XD
                  return null;
                },
                onChanged: (String value){
                  _typedPassword = value;
                },
              ),
              type==TypeOfAuthentication.register? retypePassword:Text(""),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: (){
                      _authenticate();
                    },
                    textColor: Colors.white,
                    child: type==TypeOfAuthentication.register? Text("Register"):Text("Login"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      changeType();
                    },
                    textColor: Colors.white,
                    child: type==TypeOfAuthentication.register? Text("Back to login"):Text("I don't have account"),
                  )
                ],
              )

            ])

    );
  }
}


