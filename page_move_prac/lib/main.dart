import 'package:flutter/material.dart';
import 'package:page_move_prac/firstPage.dart';
import 'package:page_move_prac/secondPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Page move with page route',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FirstPage(),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage()
      },
    );
  }
}
