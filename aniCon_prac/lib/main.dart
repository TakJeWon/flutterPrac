import 'package:flutter/material.dart';
// import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation container',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyAnimationApp(),
    );
  }
}

// //Animated Container
// class MyAnimationApp extends StatefulWidget {
//   @override
//   _MyAnimationAppState createState() => _MyAnimationAppState();
// }
//
//
// class _MyAnimationAppState extends State<MyAnimationApp> {
//   var _size = 100.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('animation container'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: (){
//             final random = Random();
//             setState(() {
//               //100.0 ~ 299.0 사이의 실수를 랜덤하게 얻
//               _size = random.nextInt(200).toDouble() + 100;
//             });
//           },
//           child: AnimatedContainer(
//             duration: Duration(seconds: 1),
//             width: _size,
//             height: _size,
//             child: Image.asset('lib/images/jk.png'),
//             curve: Curves.fastOutSlowIn,
//           ),
//         ),
//       ),
//     );
//   }
// }


class MyAnimationApp extends StatelessWidget {

  final _items = List.generate(50, (i) => ListTile(title: Text('No. $i')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView (
        slivers: <Widget>[

          SliverAppBar(  //헤더
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('JK'),
              background: Image.asset(
                'lib/images/jk_crop.png',
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () { },
                  icon: Image.asset('lib/images/jk_crop.png')
              ),
            ],
          ),

          SliverList( //내용..
            delegate: SliverChildListDelegate(_items),
          ),
        ],
      ),
    );
  }
}
