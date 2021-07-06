import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/GlobalState.dart';

class DitalesClothes extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return new PartDitales();

    throw UnimplementedError();
  }



}


class PartDitales extends State<DitalesClothes>{

  GlobalState _store = GlobalState.instance;








 onClick(){


  }


  @override
  Widget build(BuildContext context) {

    Color newColor1 =Color(int.parse(_store.get('c1')));
    Color newColor2 =Color(int.parse(_store.get('c2')));
    Color newColor3 =Color(int.parse(_store.get('c3')));
    Color newColor4 =Color(int.parse(_store.get('c4')));
    Color newColor5 =Color(int.parse(_store.get('c5')));




    return new  Scaffold(


      appBar: AppBar(

        backgroundColor: Colors.blue,
      ),

      body: new ListView(children: [





      new Column(children: [

        new Text(_store.get("name")),

       new Text(_store.get("price").toString()),


       CircleAvatar(

          backgroundImage: NetworkImage(_store.get("image1")),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: newColor1,
          child: RaisedButton(
            onPressed: () {},
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: Colors.grey,
          child: RaisedButton(
            onPressed: () {},
            child: Text(_store.get("num1")),
          ),
        ),




        CircleAvatar(

          backgroundImage: NetworkImage(_store.get("image2")),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: newColor2,
          child: RaisedButton(
            onPressed: () {},
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: Colors.grey,
          child: RaisedButton(
            onPressed: () {},
            child: Text(_store.get("num2")),
          ),
        ),











        CircleAvatar(

          backgroundImage: NetworkImage(_store.get("image3")),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: newColor3,
          child: RaisedButton(
            onPressed: () {},
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: Colors.grey,
          child: RaisedButton(
            onPressed: () {},
            child: Text(_store.get("num3")),
          ),
        ),












        CircleAvatar(

          backgroundImage: NetworkImage(_store.get("image4")),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: newColor4,
          child: RaisedButton(
            onPressed: () {},
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: Colors.grey,
          child: RaisedButton(
            onPressed: () {},
            child: Text(_store.get("num4")),
          ),
        ),










        CircleAvatar(

          backgroundImage: NetworkImage(_store.get("image5")),
        ),




        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: newColor5,
          child: RaisedButton(
            onPressed: () {},
          ),
        ),


        ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          buttonColor: Colors.grey,
          child: RaisedButton(
            onPressed: () {},
            child: Text(_store.get("num5")),
          ),
        ),








      ],),








    ],),
    
    );
    
    
    



    throw UnimplementedError();
  }




}