import 'package:flutter/material.dart';
import 'package:news_app_flutter/app/data/network/http/news_api.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class NewsItemList extends StatefulWidget {
  const NewsItemList({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsItemList> createState() => _NewsItemListState();
}

class _NewsItemListState extends State<NewsItemList> {
  late Future<NewsHeadlines> _newsHeadlines;

  @override
  void initState() {
    super.initState();
    _newsHeadlines = getNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsHeadlines>(
      future: _newsHeadlines,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (context, index) {
                return NewsItem(
                  article: snapshot.data!.articles![index],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Oops! An error occurred ${snapshot.error.toString()}',
                style: AppStyles.newsCardText1,
              ),
            );
          }
        }
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Loading news articles...',
            style: AppStyles.newsCardText1,
          ),
        );
      },
    );
  }
}
