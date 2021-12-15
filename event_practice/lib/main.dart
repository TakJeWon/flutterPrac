import "package:flutter/material.dart";

void main(){
  runApp(MyEventApp());
}


class MyEventApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Event practice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyEventHomePage(),
    );
  }
}

class MyEventHomePage extends StatefulWidget {
  @override
  _MyEventHomePageState createState() => _MyEventHomePageState();
}

class _MyEventHomePageState extends State<MyEventHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gesture detector and inkWell'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            GestureDetector(
              onTap: () {
                print("GestureDetector click");
              },
              child: Text('click me!'),
            ),

            InkWell(
              onTap: (){
                print("InkWell click");
              },
              child: Text('click me!'),
            ),
          ],
        ),
      ),
    );
  }
}