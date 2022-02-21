import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({
    required this.articles,
    Key? key,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return NewsItem(article: articles[index]);
      },
    );
  }
}
