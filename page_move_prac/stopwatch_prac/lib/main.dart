import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(StopWatchApp());
}

class StopWatchApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Stop Watch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StopWatchHomePage(),
    );
  }
}

class StopWatchHomePage extends StatefulWidget {

  @override
  _StopWatchHomePageState createState() => _StopWatchHomePageState();
}

class _StopWatchHomePageState extends State<StopWatchHomePage> {


  late Timer _timer;

  var _time = 0;
  var _isRunning = false;

  List<String> _lapTimes = [];

  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _clickButton();
        }),
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody(){

    var sec = _time ~/ 100;
    var hundredth = '${_time%100}'.padLeft(2,'0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[

            Column(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(
                      '$sec',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('$hundredth')
                  ],
                ),

                Container(
                  width: 100,
                  height: 200,
                  child: ListView(
                    children: _lapTimes.map((time) => Text(time)).toList()
                  ),
                ),
              ],
            ),

            //positioned 로 겹치는 위젯 만들 수 있다. => 여백 크기 지정(left,right,bottom ..)
            Positioned(
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                onPressed: _reset,
                child: Icon(Icons.rotate_left),
              ),
            ),

            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _recordLapTime('$sec.$hundredth');
                  });
                },
                child: Text('랩 타임'),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _clickButton() {
    _isRunning = !_isRunning;

    if(_isRunning){
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset(){
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $time');
  }


}

