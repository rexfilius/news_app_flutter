import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_app_lib.dart';

class NewsItemList2 extends StatefulWidget {
  const NewsItemList2({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsItemList2> createState() => _NewsItemList2State();
}

class _NewsItemList2State extends State<NewsItemList2> {
  late Future<NewsHeadlines> newsHeadlinesFuture;
  List<Article> newsArticleList = [];
  late NewsHeadlines newsHeadlines;

  final scrollController = ScrollController();
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //_newsHeadlines = getNewsHeadlinesV2(page: page);
    newsHeadlinesFuture = getNewsHeadlinesV2(page: 1, pageSize: 15);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetchNewsArticles();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future fetchNewsArticles() async {
    if (isLoading) return;
    isLoading = true;
    const pageSize = 15;
    newsHeadlines = await getNewsHeadlinesV2(page: page++, pageSize: pageSize);
    newsArticleList.addAll(newsHeadlines.articles!.toList());

    setState(() {
      page++;
      isLoading = false;
      if (newsArticleList.length < 20) {
        hasMore = false;
      }
    });

    return newsHeadlines;
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1;
      newsArticleList.clear();
    });

    fetchNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsHeadlines>(
      future: newsHeadlinesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                itemCount: (snapshot.data?.articles?.length)! + 1,
                itemBuilder: (context, index) {
                  if (index < snapshot.data!.articles!.length) {
                    newsArticleList = snapshot.data!.articles!;
                    return NewsItem(
                      article: newsArticleList[index],
                    );
                  } else {
                    // if it is last item - show loading indicator
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: hasMore
                          ? const Center(child: CircularProgressIndicator())
                          : const Text('No more data to load'),
                    );
                  }
                },
              ),
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
