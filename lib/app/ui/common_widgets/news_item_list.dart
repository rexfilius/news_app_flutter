import 'package:flutter/material.dart';
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
            return ErrorListState(snapshot: snapshot);
          }
        }
        return const LoadingListState(message: 'Loading news articles');
      },
    );
  }
}
