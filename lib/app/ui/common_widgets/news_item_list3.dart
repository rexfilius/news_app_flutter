import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/api_token.dart';

class NewsItemList3 extends StatefulWidget {
  const NewsItemList3({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsItemList3> createState() => _NewsItemList3State();
}

class _NewsItemList3State extends State<NewsItemList3> {
  late Future<NewsHeadlines> newsHeadlinesFuture;

  // This holds the posts fetched from the server
  List<Article> articleList = [];

  late NewsHeadlines newsHeadlines;

  // The controller for the ListView
  late ScrollController scrollController;

  // At the beginning, we fetch the first 15 posts
  int page = 0;
  int limit = 15;

  // There is next page or not
  bool hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool isLoadMoreRunning = false;

  // This function will be called when the app launches
  void firstLoad() async {
    setState(() {
      isFirstLoadRunning = true;
    });
    try {
      final response = await http.get(Uri.parse(
          '${baseUrl}top-headlines?country=us&apiKey=$apiKey&page=$page&pageSize=$limit'));
      setState(() {
        newsHeadlines = jsonDecode(response.body);
        articleList = newsHeadlines.articles!;
      });
    } catch (e) {
      throw Exception('');
    }
    setState(() {
      isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenever the user scrolls
  // to near the bottom of the list view
  void loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      setState(() {
        isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      page += 1;
      try {
        final response = await http.get(Uri.parse(
            '${baseUrl}top-headlines?country=us&apiKey=$apiKey&page=$page&pageSize=$limit'));
        newsHeadlines = jsonDecode(response.body);
        final List<Article> fetchedArticles = newsHeadlines.articles!;

        if (fetchedArticles.length > 0) {
          setState(() {
            articleList.addAll(fetchedArticles);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            hasNextPage = false;
          });
        }
      } catch (e) {
        throw Exception('');
      }
      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    firstLoad();
    scrollController = ScrollController()..addListener(loadMore);
  }

  @override
  void dispose() {
    scrollController.removeListener(loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstLoadRunning
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    return NewsItem(article: articleList[index]);
                  },
                ),
              ),
              // when the loadMore function is running
              if (isLoadMoreRunning == true)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              // When nothing else to load
              if (hasNextPage == false)
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  color: Colors.amber,
                  child: const Center(
                    child: Text('You have fetched all of the content'),
                  ),
                ),
            ],
          );
  }
}

/*
*
* @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsHeadlines>(
      future: newsHeadlinesFuture,
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
  }*/
