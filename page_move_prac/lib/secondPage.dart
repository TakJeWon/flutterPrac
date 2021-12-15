import 'package:flutter/material.dart';
import 'package:page_move_prac/firstPage.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: ElevatedButton(
        child: Text('이전 페이지로'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}