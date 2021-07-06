

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _onClickPrint() {
      print('Hello Alarm');
    }
    _onClickPrinting() {
      print('Hello Printing');
    }

    _onBluetooth_connected() {
      print('Bluetooth connected');
    }


    return new Scaffold(
      backgroundColor: Colors.white70,
      appBar: new AppBar(
        title: new Text('Essa App'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.alarm),
              onPressed: _onClickPrint),
          new IconButton(icon: new Icon(Icons.print),
              onPressed: _onClickPrinting),
        ],
      ),


      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.add),
                onPressed: _onClickPrinting),
            new IconButton(icon: new Icon(Icons.account_box),
                onPressed: _onClickPrinting),
            new Text('Hello Muhammed',
              style: new TextStyle(
                fontSize: 32.8,
                color: Colors.deepPurple,

              ),
            ),

            new InkWell(
              child: new Text('InkWell',
                style: new TextStyle(
                  fontSize: 32.8,
                  color: Colors.amberAccent.shade50,

                ),
              ),
              onDoubleTap: () => debugPrint("double tapped!"),
              onTap: () => debugPrint("single tapped!"),
            ),

          ],
        ),
      ),

    );
  }
}
