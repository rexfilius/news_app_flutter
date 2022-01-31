import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_article_model.dart';

class NewsItemCard extends StatelessWidget {
  final Articles? article;

  const NewsItemCard({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.asset(article.urlToImage ?? 'No Image')
            // 2 ways to show image: NetworkImage or Image.asset()
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: Image(
                image: NetworkImage(article?.urlToImage ?? ''),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article?.title ?? 'No title',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    article?.description ?? 'No description',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
