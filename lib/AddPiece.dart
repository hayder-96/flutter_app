import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class AddPiece extends StatefulWidget{
  var id;
  AddPiece(this.id);
  @override
  State<StatefulWidget> createState() {



    return new PartPiece(id);
    throw UnimplementedError();
  }




}

class PartPiece extends State<AddPiece>{


  var id;
  PartPiece(this.id);

  TextEditingController textname=new TextEditingController();
  TextEditingController price=new TextEditingController();




  var f1;
  var f2;
  var f3;
  var f4;
  var f5;
  Future getImage(int im) async{


    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {

      setState(() {
        print(pickedFile.path);

        if(im==1){
          f1= File(pickedFile.path);
        }else if(im==2){
          f2= File(pickedFile.path);
        }else if(im==3){
          f3= File(pickedFile.path);
        }else if(im==4){
          f4= File(pickedFile.path);
        }else{
          f5=File(pickedFile.path);
        }

      });

    }
  }





  // create some values
  Color pickerColor1 = Color(0xff443a49);
  late Color pickerColor2 =Color(0xff443a49) ;
  late Color pickerColor3=Color(0xff443a49) ;
  late Color pickerColor4 =Color(0xff443a49);
  late Color pickerColor5= Color(0xff443a49);
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor1 = color);

    print(color.toString());
  }

  void changeColor2(Color color) {
    setState(() => pickerColor2 = color);


  }

  void changeColor3(Color color) {
    setState(() => pickerColor3 = color);


  }


  void changeColor4(Color color) {
    setState(() => pickerColor4 = color);


  }


  void changeColor5(Color color) {
    setState(() => pickerColor5 = color);


  }






   ChangeColor1(String choose){

     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
             titlePadding: const EdgeInsets.all(0.0),
             contentPadding: const EdgeInsets.all(0.0),
             content: SingleChildScrollView(
               child: ColorPicker(
                 pickerColor: pickerColor1,
                 onColorChanged:choose=="c1"?changeColor:changeColor2,
                 colorPickerWidth:300.0,
                 pickerAreaHeightPercent: 0.7,
                 enableAlpha: true,
                 displayThumbColor: true,
                 showLabel: true,
                 paletteType: PaletteType.hsv,
                 pickerAreaBorderRadius: const BorderRadius.only(
                   topLeft: const Radius.circular(2.0),
                   topRight: const Radius.circular(2.0),
                 ),
               ),
             ));
       },
     );


}





  ChangeColor2(String choose){

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: const EdgeInsets.all(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor1,
                onColorChanged:choose=="c3"?changeColor3:changeColor4,
                colorPickerWidth:300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: true,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsv,
                pickerAreaBorderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(2.0),
                  topRight: const Radius.circular(2.0),
                ),
              ),
            ));
      },
    );


  }




  ChangeColor3(){

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: const EdgeInsets.all(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor1,
                onColorChanged:changeColor5,
                colorPickerWidth:300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: true,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsv,
                pickerAreaBorderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(2.0),
                  topRight: const Radius.circular(2.0),
                ),
              ),
            ));
      },
    );


  }

  int i=1;
  int ii=1;
  int iii=1;
  int iiii=1;
  int iiiii=1;

  upNumber(int num){

    setState(() {

      switch(num){
        case 1:
          i++;
          break;

        case 2:
          ii++;
          break;

        case 3:
          iii++;
          break;


        case 4:
          iiii++;
          break;


        case 5:
          iiiii++;
          break;
      }



    });


  }



  downNumber(int num){

    setState(() {

      switch(num){
        case 1:

          if(i==1){
            i=1;
            return;
          }
          i--;
          break;

        case 2:

          if(ii==1){
            ii=1;
            return;
          }
          ii--;
          break;


        case 3:

          if(iii==1){
            iii=1;
            return;
          }
          iii--;
          break;



        case 4:

          if(iiii==1){
            iiii=1;
            return;
          }
          iiii--;
          break;



        case 5:

          if(iiiii==1){
            iiiii=1;
            return;
          }
          iiiii--;
          break;
      }



    });


  }















  @override
  Widget build(BuildContext context) {



    return Scaffold(


      appBar: new AppBar(

        backgroundColor: Colors.deepPurple,
      ),


      body: ListView(

    children:[
        new Column(children: [



          TextField(

            decoration: new InputDecoration(

              hintText: "الاسم",

            ),

            controller: textname,
          ),


          TextField(

            decoration: new InputDecoration(

              hintText: "السعر",

            ),

            controller: price,
          ),

          GestureDetector(
            onTap:()=>getImage(1),
            child: Container(
              child: f1==null?Icon(Icons.add):Image.file(f1,height: 100,width: 100,),
            ),
          ),





          TextButton(onPressed:()=>ChangeColor1("c1"),


     child:new Text("اضف لون",style: new TextStyle(color:Colors.black87,backgroundColor: pickerColor1,fontSize: 20.1),) ),



    new Center(


         child:Row(children: [

            TextButton(onPressed:()=>upNumber(1),


                child:new Text("+",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



            new Text("$i",style: new TextStyle(color:Colors.black87,fontSize: 20.1),),




            TextButton(onPressed:()=>downNumber(1),


                child:new Text("-",style: new TextStyle(color:Colors.black87),) ),

          ],),

          ),











          GestureDetector(
            onTap:()=>getImage(2),
            child: Container(
              child: f2==null?Icon(Icons.add):Image.file(f2,height: 100,width: 100,),
            ),
          ),


          TextButton(onPressed:()=>ChangeColor1("c2"),


              child:new Text("اضف لون",style: new TextStyle(color:Colors.black87,backgroundColor: pickerColor2,fontSize: 20.1),) ),




    new Container(

    alignment: Alignment.center,
   child:Row(children: [

    TextButton(onPressed:()=>upNumber(2),


    child:new Text("+",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



    new Text("$ii",style:new TextStyle(color:Colors.black87,fontSize: 20.1)),




    TextButton(onPressed:()=>downNumber(2),


    child:new Text("-",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),

    ],),
    ),

















          GestureDetector(
            onTap:()=>getImage(3),
            child: Container(
              child: f3==null?Icon(Icons.add):Image.file(f3,height: 100,width: 100,),
            ),
          ),


          TextButton(onPressed:()=>ChangeColor2("c3"),


              child:new Text("اضف لون",style: new TextStyle(color:Colors.black87,backgroundColor: pickerColor3,fontSize: 20.1),) ),

    new Container(

    alignment: Alignment.center,
        child:  Row(children: [

            TextButton(onPressed:()=>upNumber(3),


                child:new Text("+",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



            new Text("$iii",style:new TextStyle(color:Colors.black87,fontSize: 20.1)),




            TextButton(onPressed:()=>downNumber(3),


                child:new Text("-",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),

          ],),

    ),









          GestureDetector(
            onTap:()=>getImage(4),
            child: Container(
              child: f4==null?Icon(Icons.add):Image.file(f4,height: 100,width: 100,),
            ),
          ),


          TextButton(onPressed:()=>ChangeColor2("c4"),


              child:new Text("اضف لون",style: new TextStyle(color:Colors.black87,backgroundColor: pickerColor4,fontSize:20.1),) ),


    new Container(

    alignment: Alignment.center,
        child: Row(children: [

            TextButton(onPressed:()=>upNumber(4),


                child:new Text("+",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



            new Text("$iiii",style:new TextStyle(color:Colors.black87,fontSize: 20.1)),




            TextButton(onPressed:()=>downNumber(4),


                child:new Text("-",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),

          ],),

    ),








          GestureDetector(
            onTap:()=>getImage(5),
            child: Container(
              child: f5==null?Icon(Icons.add):Image.file(f5,height: 100,width: 100,),
            ),
          ),

          TextButton(onPressed:ChangeColor3,


              child:new Text("اضف لون",style: new TextStyle(color:Colors.black87,backgroundColor: pickerColor5,fontSize: 20.1),) ),


    new Container(

    alignment: Alignment.center,
        child: Row(children: [

            TextButton(onPressed:()=>upNumber(5),


                child:new Text("+",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



            new Text("$iiiii",style:new TextStyle(color:Colors.black87,fontSize: 20.1)),




            TextButton(onPressed:()=>downNumber(5),


                child:new Text("-",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),

          ],),
    ),


          TextButton(onPressed:()=>addData(id,textname.text.toString(),price.text.toString(),f1,f2,f3,f4,f5,i.toString(),ii.toString(),iii.toString(),iiii.toString(),iiiii.toString(),pickerColor1.value.toString(),pickerColor2.value.toString(),pickerColor3.value.toString(),pickerColor4.value.toString(),pickerColor5.value.toString()),


              child:new Text("حفظ",style: new TextStyle(color:Colors.black87,fontSize: 20.1),) ),



        ],),
      ],



),

    );













    throw UnimplementedError();
  }







  addData(var idi,String name ,var price,File image1,File image2,File image3,File image4,File image5
      ,String num1,String num2,String num3,String num4,String num5,String color1,String color2,String color3,String color4,String color5) async {

    if(name.isEmpty){
      print("no name");
      return;
    }
    final prefs=await SharedPreferences.getInstance();

    String? t=prefs.getString("token");
    Uri url = Uri.parse("https://damp-plateau-92967.herokuapp.com/api/clothesdetail");


    final multipartRequest = new https.MultipartRequest('POST', url);

    Map<String, String> map = {
      "Accept":"application/json",
      "Authorization":"Bearer  $t"

    };
    var im1= await https.MultipartFile.fromPath("image1",image1.path);
    var im2= await https.MultipartFile.fromPath("image2",image2.path);
    var im3= await https.MultipartFile.fromPath("image3",image3.path);
    var im4= await https.MultipartFile.fromPath("image4",image4.path);
    var im5= await https.MultipartFile.fromPath("image5",image5.path);

    multipartRequest.headers.addAll(map);
    multipartRequest.files.add(im1);
    multipartRequest.files.add(im2);
    multipartRequest.files.add(im3);
    multipartRequest.files.add(im4);
    multipartRequest.files.add(im5);




    multipartRequest.fields['name']=name;
    multipartRequest.fields['price']=price;
    multipartRequest.fields['number1']=num1;
    multipartRequest.fields['number2']=num2;
    multipartRequest.fields['number3']=num3;
    multipartRequest.fields['number4']=num4;
    multipartRequest.fields['number5']=num5;

    multipartRequest.fields['color1']=color1;
    multipartRequest.fields['color2']=color2;
    multipartRequest.fields['color3']=color3;
    multipartRequest.fields['color4']=color4;
    multipartRequest.fields['color5']=color5;


    multipartRequest.fields['detail_id']=idi.toString();
    var re=await multipartRequest.send();
    if(re.statusCode==200){
      print("done save");
    }else{
      print("field save");
    }


  }












}