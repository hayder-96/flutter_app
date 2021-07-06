import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'dart:io';
class UpClothes extends StatefulWidget{

  var idi;
  var image;
  var name;
  UpClothes(this.idi,this.name,this.image);
  @override
  State<StatefulWidget> createState() {


    return new PartClothes(idi,name,image);
    throw UnimplementedError();
  }


}


class PartClothes extends State<UpClothes>{
  var id;
  var image;
  var name;
  PartClothes(this.id,this.name,this.image);


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

        f= File(pickedFile.path);
      });

    }
  }






  @override
  Widget build(BuildContext context) {



   return new Scaffold(

     appBar: AppBar(
       backgroundColor: Colors.blue,
     ),

     body: new Container(
       child: new Column(
         children: [




           TextField(



             decoration: new InputDecoration(

       suffixIcon: Padding(      //suffixIcon, this way it don't disapear when the TextField is unfocused
       padding: EdgeInsets.only(top: 20), //padding to put closer to the line
       child: Text(
         name,
         style: TextStyle(
           color: Colors.grey,
         ),
       ),
     ),
   ),




             controller: textName,
           ),



           TextButton(onPressed:getImage,child: new Text("تغيير الصورة")),


            Container(

             child: f==null?Image.network(image):Image.file(f,height: 100,width: 100,),
           ),



           // Material(
           //     child: InkWell(
           //       onTap: ()=>getImage(),
           //
           //
           //       child: Container(
           //         child: ClipRRect(
           //             borderRadius: BorderRadius.circular(20.0),
           //           child: f==null?Image.network(image):Image.file(f,height: 100,width: 100,),
           //         ),),
           //     )
           // ),







          TextButton(onPressed:()=>upData(id,textName.text,f), child: new Text("تحديث",style: new TextStyle(
              backgroundColor: Colors.blueGrey,
              fontSize: 15.1,
              color: Colors.black87

          ),)),


           TextButton(onPressed:()=>deleteData(id), child: new Text("حذف",style: new TextStyle(
               backgroundColor: Colors.blueGrey,
               fontSize: 15.1,
               color: Colors.black87

           ),)),





         ],
       ),
     ),


   );
    throw UnimplementedError();
  }








  upData(var id,var name ,var image) async {

    if(name.isEmpty){
      print("no name");
      return;
    }
    final prefs=await SharedPreferences.getInstance();

    String? t=prefs.getString("token");
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/upclothes");


    final multipartRequest = new https.MultipartRequest('POST', url);

    Map<String, String> map = {
      "Accept":"application/json",
      "Authorization":"Bearer  $t"

    };
    var r= await https.MultipartFile.fromPath("image",image.path);

    multipartRequest.headers.addAll(map);
    multipartRequest.fields['id']=id.toString();

    if(image.path.isNotEmpty) {

      multipartRequest.files.add(r);
    }
    multipartRequest.fields['name']=name;

    var re=await multipartRequest.send();
    if(re.statusCode==200){
      print("done up");
    }else{
      print("field up");
    }


  }






  deleteData(var id) async {

    final prefs=await SharedPreferences.getInstance();

    String? t=prefs.getString("token");

    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/clothesuser/$id");


    https.delete(url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer  $t"
      },

    ).then((response) {

    });
  }






}