

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/GetClothes.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new PartRegister();
    throw UnimplementedError();
  }





}

class PartRegister extends State<Register>{


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

          title: new Text("Register"),


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

                  child: new TextField(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    controller: _controller,

                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0

                    ),
                    decoration: new InputDecoration(


                      hintText: "ادخل البريد الالكتروني",
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
                    child:  new 	TextButton(onPressed:()=> registerData()
                      , child: new Text("Register"),
                      style:flatButtonStyle,)
                )
              ],)


          ),

        )

    );


    throw UnimplementedError();
  }







  registerData() {
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/Register");


    http.post(url,
        headers: {
          "Accept": "application/json",
        },

        body: {

          "name":"noor",
          "email":"noor@gmail.com",
          "password":"00000000",
            "c_password":"00000000"


        }).then((response) {

      Map map=json.decode(response.body);
         if(map.values.toString().isNotEmpty){

           var data = json.decode(response.body);
           saveToken(data["token"]);
           print(data["token"]);
           Navigator.push(context,MaterialPageRoute(builder: (context) =>GetClothes()));
         }
      print(map.values.toString());
    });
  }




  void saveToken(String token) async{

    final prefs=await SharedPreferences.getInstance();

    prefs.setString("token",token);


  }


  void getToken() async{

    final prefs=await SharedPreferences.getInstance();

    prefs.getString("token");


  }












}