
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:http_parser/http_parser.dart';
class AddData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PartAdd();
    throw UnimplementedError();
  }



}


class PartAdd extends State<AddData>{

  TextEditingController textName=new TextEditingController();

  var f;

  Future getImage() async{

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {

      setState(() {
        print(pickedFile.path);

         f= File(pickedFile.path);
      });

    }
  }

  @override
  Widget build(BuildContext context) {



    return new Scaffold(

      appBar: AppBar(

        title: new Text("Add Clothes"),

      ),

      body: new Center(

        child: new Column(children: [




          TextButton(onPressed:getImage,child: new Text("اضف صورة")),

             GestureDetector(
               onTap:getFromGallery,
               child: Container(
                 child: f==null?Icon(Icons.add):Image.file(f,height: 100,width: 100,),
               ),
             ),














          new TextField(


            decoration: new InputDecoration(


              hintText: "ادخل الاسم"
            ),

            controller: textName,



          ),






          new TextButton(onPressed:()=>addData(textName.text,f), child: new Text("اضافة",style: new TextStyle(
            backgroundColor: Colors.blueGrey,
            fontSize: 15.1,
            color: Colors.black87

          ),))


        ],),


      ),

    );








    throw UnimplementedError();
  }




  addData(String name ,File image) async {

    if(name.isEmpty){
      print("no name");
      return;
    }
    final prefs=await SharedPreferences.getInstance();

    String? t=prefs.getString("token");
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/clothes");


    final multipartRequest = new https.MultipartRequest('POST', url);

    Map<String, String> map = {
      "Accept":"application/json",
    "Authorization":"Bearer  $t"

    };
    var r= await https.MultipartFile.fromPath("image",image.path);

    multipartRequest.headers.addAll(map);
    multipartRequest.files.add(r);
    multipartRequest.fields['name']=name;
    var re=await multipartRequest.send();
    if(re.statusCode==200){
      print("done save");
    }else{
      print("field save");
    }


  }



  getFromGallery() async {




    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
    var f=pickedFile;


    }
  }



}