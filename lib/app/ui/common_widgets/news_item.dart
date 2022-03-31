import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.webViewScreen,
          arguments: article,
        );
      },
      child: Card(
        elevation: 8.0,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? 'No title',
                style: AppStyles.newsCardText1,
              ),
              Text(
                article.description ?? 'No description',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Source - ${article.source?.name}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
