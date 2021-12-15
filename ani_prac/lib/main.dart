import 'package:flutter/material.dart';

void main(){
  runApp(MyAnimationApp());
}

class MyAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation all',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyAnimationHomePage(),
    );
  }
}

//Hero 위젯 - 애니메이션 효과 대상 감싸기, tag 프로퍼티 동일하게 !!
// 한페이지 => 다른 페이지로 가면서 animation

class MyAnimationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
      ),
      body: Center(

        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimationDetailPage())
            );
          },

          child: Hero(
            tag: 'image', // this tag have to be same with second page's tag
            child: Image.asset(
              'lib/images/jk.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}


class AnimationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Hero(
        tag: 'image', //tab name is same with the last page's tag name
        child: Image.asset('lib/images/jk.png'),
      ),
    );
  }
}