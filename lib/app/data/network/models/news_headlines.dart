import 'package:news_app_flutter/news_app_lib.dart';

class NewsHeadlines {
  NewsHeadlines({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory NewsHeadlines.fromJson(Map<String, dynamic> json) {
    return NewsHeadlines(
      status: json["status"],
      totalResults: json["totalResults"],
      articles:
          List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((x) => x.toJson()).toList();
    }
    return map;
  }
}
