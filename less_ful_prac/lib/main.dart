import 'package:flutter/material.dart';

class Person{
  String name;
  int age;

  Person(this.name, this.age);
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page move prac',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FirstStatefulPage(),
    );
  }
}

class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage>{
  @override
  Widget build(BuildContext){
    print("First page build()");
    return Scaffold(
      appBar: AppBar(
        title: Text('ful page move'),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () {
          final person = Person('홍길동', 20);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondStatefulPage(person: person)),
          );
        },
      ),
    );
  }
}

class SecondStatefulPage extends StatefulWidget {
  final Person person;

  SecondStatefulPage({Key? key, required this.person}): super(key: key);

  @override
  _SecondStatefulPageState createState() => _SecondStatefulPageState();

}

class _SecondStatefulPageState extends State<SecondStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
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