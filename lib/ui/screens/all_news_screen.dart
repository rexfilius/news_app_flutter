import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response<NetworkResult<NewsResponse>>>(
      future: NewsApiService.create().getTopHeadlines(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final result = snapshot.data?.body;
            if (result is NetworkSuccess) {
              NewsResponse newsResponse = (result as NetworkSuccess).value;
              return NewsItemList(articles: newsResponse.articles);
            } else if (result is NetworkError) {
              return Center(
                child: Text(
                    'Network Error: ${(result as NetworkError).exception}'),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
