

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Register.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

import 'GetClothes.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new PartLogin();
    throw UnimplementedError();
  }




}

class PartLogin extends State<Login>{


  TextEditingController _controller=new TextEditingController();

  TextEditingController password=new TextEditingController();

  void onClick() {
    setState(() {
      if (_controller.text=="hayder" && password.text=="0000" ) {
        print("hayder//0000");

      }else{
        print("false name and password");

      }
    });

  }









  @override
  Widget build(BuildContext context) {


    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.white,
      primary: Colors.black,

      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
    return new Scaffold(

      appBar: new AppBar(

        backgroundColor: Colors.blue,

        title: new Text("Login"),


      ),

    body: new Container(

      child:Card(



        shadowColor: Colors.grey,
        margin:EdgeInsets.all(20.0),
     elevation:10,
     color: Colors.lightBlue,


     child: new Column(children: [

       new Container(

      child: new TextField(
        textAlign: TextAlign.center,
         maxLines: 2,
       controller: _controller,

       style: TextStyle(
         color: Colors.black,
         fontSize: 20.0

       ),
         decoration: new InputDecoration(


           hintText: "ادخل اسمك",
           icon: new Icon(Icons.supervised_user_circle,color: Colors.white),

         ),



       ),

         padding: EdgeInsets.only(top: 30),
       ),

       new Container(
       child:new TextField(
         obscureText: true,
         controller: password,
         style: TextStyle(
             color: Colors.black,
             fontSize: 20.0
         ),
         textAlign: TextAlign.center,
         decoration: new InputDecoration(

           hintText: "ادخل الرمز",
           icon: new Icon(Icons.password_outlined,color: Colors.white,),

         ),


       ),

    padding: new EdgeInsets.only(top:30),

       ),

       new Container(

         padding: new EdgeInsets.only(top:30),
      child: new 	TextButton(onPressed:()=> loginData(),
         child: new Text("Login",),style: flatButtonStyle),

       ),





       new Container(
           padding: new EdgeInsets.only(top:30),
     child:  new 	TextButton(onPressed:() {
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) =>Register()),
       );
     }
         , child: new Text("Register"),
         style:flatButtonStyle,)
       )
     ],)


      ),

    )

    );


    throw UnimplementedError();
  }



  loginData() {
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/Login");


    https.post(url,
        headers: {
          "Accept": "application/json",
        },

        body: {

      "email":"noor@gmail.com",
          "password":"00000000",


        }).then((response) {


      Map map=json.decode(response.body);

      if(response.body.isNotEmpty){
        var data = json.decode(response.body);
        saveToken(data["token"]);
          print(data["token"]);
        Navigator.push(context,MaterialPageRoute(builder: (context) =>GetClothes()));
      }
      else{


      }
      print(response.statusCode);




    });
  }


  void saveToken(String token) async{

    final prefs=await SharedPreferences.getInstance();

    prefs.setString("token",token);


  }

}