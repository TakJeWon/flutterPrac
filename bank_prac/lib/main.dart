import 'package:flutter/material.dart';
import 'package:bank_prac/CastisBankHomePage.dart';
import 'package:bank_prac/AlarmPage.dart';
import 'package:bank_prac/SettingPage.dart';

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Castis Bank',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CastisBankHomePage(),
    );
  }
}

class CastisBankHomePage extends StatefulWidget {

  @override
  _CastisBankHomePageState createState() => _CastisBankHomePageState();
}

class _CastisBankHomePageState extends State<CastisBankHomePage> {
  var _index = 0;

  var _pages = [
    CastisBankHomePage(),
    AlarmPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Castis Bank'),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Alarm',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'setting',
            icon: Icon(Icons.person), //어울리는 아이콘 찾기
          ),
        ],
      ),
    );
  }
}

//MVC 나눠서 진행해보기! 플러터 특히나 .. 알아보기 힘듦 ;;
