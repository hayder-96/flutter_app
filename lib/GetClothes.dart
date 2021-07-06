import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AddData.dart';
import 'package:flutter_app/TypeClothes.dart';
import 'package:flutter_app/UpClothes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;

class GetClothes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PartClothes();

  }




}


class PartClothes extends State<GetClothes> {









  @override
  Widget build(BuildContext context) {


    return new Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blueAccent,
        title: new Text("Clothes"),


      ),

      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddData(),
            )
        ),
      ),
      body:  Container(
      child: FutureBuilder(
    future: getData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.data == null) {
        return Container(
          child: Center(child: Text("Loading..."),),
        );
      }else{
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index){
            return Row(children: [

              Material(
                  child: InkWell(
                    onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new TypeClothes(snapshot.data[index]['id']) ),

            ) ,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(snapshot.data[index]["image"])
                      ),),
                  )
              ),


             // new Image.network(snapshot.data[index]["image"]),
              // leading: CircleAvatar(
              //
              //   backgroundImage: NetworkImage(),
              // ),

              new Text(snapshot.data[index]["name"],),


              new TextButton(onPressed:()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>  new UpClothes(snapshot.data[index]['id'],snapshot.data[index]["name"],snapshot.data[index]["image"]) ),

              ) ,
              child: new Text("تعديل"),),




            ],


            );
          },
        );
      }

    }
),
    ),

    );


    throw UnimplementedError();
  }


  Future<List> getData() async {

    final prefs=await SharedPreferences.getInstance();

   String? t=prefs.getString("token");
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/clothes");


    https.Response response = await https.get(url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer  $t"
        });

    print(json.decode(response.body));

    return json.decode(response.body);
  }




  upData(int id) {
    Uri url = "https://damp-plateau-92967.herokuapp.com/api/clothesuser/$id" as Uri;


    https.put(url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer  "
        },

        body: {
        }).then((response) {

    });
  }









}











