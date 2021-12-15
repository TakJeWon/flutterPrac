import 'package:api_prac/model/source_model.dart';

class Article {
  Source source;

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: Source.fromJson(json['author']) as String,
      title: Source.fromJson(json['title']) as String,
      description: Source.fromJson(json['description']) as String,
      url: Source.fromJson(json['url']) as String,
      urlToImage: Source.fromJson(json['urlToImage']) as String,
      publishedAt: Source.fromJson(json['publishedAt']) as String,
      content: Source.fromJson(json['content']) as String,
    );
  }
}