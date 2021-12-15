import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_api_prac/model/article_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news app',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyNewsHomePage(),
    );
  }
}

//http

Future<Article> fetchArticle() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7aa6daeb3901482e94ee2875ef5d9b53"));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return Article.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Album');
  }
}

class MyNewsHomePage extends StatefulWidget {
  @override
  _MyNewsHomePageState createState() => _MyNewsHomePageState();
}

class _MyNewsHomePageState extends State<MyNewsHomePage> {
  late Future<Article> futureArticle;

  @override
  void initState() {
    super.initState();
    futureArticle = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news'),
      ),
      body: FutureBuilder<Article>(
        future: futureArticle,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data as List<Article>;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => customListTile(articles[index]),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
            print('snapshot error');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Widget customListTile(Article article) {
  return Container(
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        article.urlToImage != null
            ? Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://source.unsplash.com/weekly?coding'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            "article.source.name",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ],
    ),
  );
}
