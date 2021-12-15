import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_prac/model/article_model.dart';
import 'package:api_prac/model/api_service.dart';

void main() {
  runApp(MyApiApp());
}

class MyApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Practice",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyApiHomePage(),
    );
  }
}

class MyApiHomePage extends StatefulWidget {
  @override
  _MyApiHomePageState createState() => _MyApiHomePageState();
}

class _MyApiHomePageState extends State<MyApiHomePage> {

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) => ListTile(title: Text(articles[index].title),)
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
