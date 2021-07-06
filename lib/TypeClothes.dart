import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AddPiece.dart';
import 'package:flutter_app/DitalesClothes.dart';
import 'package:flutter_app/GlobalState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
class TypeClothes extends StatefulWidget{

  var id;
  TypeClothes(this.id);
  @override
  State<StatefulWidget> createState() {
    return new PartType(id);
    throw UnimplementedError();
  }



}

class PartType extends State<TypeClothes>{

  var id;
  PartType(this.id);
  GlobalState _store = GlobalState.instance;

  onClickBtn(name,price,im1,im2,im3,im4,im5,n1,n2,n3,n4,n5,c1,c2,c3,c4,c5){

    _store.set('name',name);
    _store.set('price',price);
    _store.set('image1',im1);
    _store.set('image2',im2);
    _store.set('image3',im3);
    _store.set('image4',im4);
    _store.set('image5',im5);
     _store.set('num1',n1);
    _store.set('num2',n2);
    _store.set('num3',n3);
    _store.set('num4',n4);
    _store.set('num5',n5);
     _store.set("c1", c1);
    _store.set("c2", c2);
    _store.set("c3", c3);
    _store.set("c4", c4);
    _store.set("c5", c5);


    Navigator.of(context).push(new MaterialPageRoute( builder:(BuildContext context)=>new DitalesClothes()));

  }

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
              builder: (BuildContext context) => new AddPiece(id),
            )
        ),
      ),

      body:  Container(
        child: FutureBuilder(
            future: getData(id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text("Loading..."),),
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return new ListTile(


                        leading: CircleAvatar(

                          backgroundImage: NetworkImage(snapshot.data[index]["image1"],),
                        ),


                      title:Text(snapshot.data[index]["name"],),
                          subtitle: Text(snapshot.data[index]["price"].toString(),),




                      onTap:()=> onClickBtn(snapshot.data[index]["name"],snapshot.data[index]["price"].toString()
                            ,snapshot.data[index]["image1"],snapshot.data[index]["image2"],snapshot.data[index]["image3"],snapshot.data[index]["image4"]
                            ,snapshot.data[index]["image5"],snapshot.data[index]['number1'],snapshot.data[index]['number2'],snapshot.data[index]['number3'],snapshot.data[index]['number4'],snapshot.data[index]['number5']
                          ,snapshot.data[index]['color1'],snapshot.data[index]['color2'],snapshot.data[index]['color3'],snapshot.data[index]['color4'],snapshot.data[index]['color5'])





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





















  Future<List> getData(var id) async {

    final prefs=await SharedPreferences.getInstance();


    String? t=prefs.getString("token");
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/getclothes/$id");


    https.Response response = await https.get(url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer  $t"
        });

    print(json.decode(response.body));

    return json.decode(response.body);
  }
}