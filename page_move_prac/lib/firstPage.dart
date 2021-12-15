import 'package:flutter/material.dart';
import 'package:page_move_prac/secondPage.dart';

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/second');

          print(result);
        },
      ),
    );
  }
}