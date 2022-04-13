import 'dart:convert';
import 'dart:io';

import 'package:news_app_flutter/api_token.dart';
import 'package:news_app_flutter/news_app_lib.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://newsapi.org/v2/';

Future<NewsHeadlines> getNewsHeadlines() async {
  String url = '${baseUrl}top-headlines?country=us&apiKey=$apiKey';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsHeadlines.fromJson(jsonDecode(response.body));
    } else {
      throw '${response.body} - Error: failed to get headlines';
    }
  } on SocketException {
    throw 'It seems you are not connected to the internet';
  } catch (e) {
    throw e.toString();
  }
}

Future<NewsHeadlines> getNewsHeadlinesV2({
  required int page,
  required int pageSize,
}) async {
  String url =
      '${baseUrl}top-headlines?country=us&apiKey=$apiKey&page=$page&pageSize=$pageSize';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsHeadlines.fromJson(jsonDecode(response.body));
    } else {
      throw '${response.body} - Error: failed to get headlines';
    }
  } on SocketException {
    throw 'It seems you are not connected to the internet';
  } catch (e) {
    throw e.toString();
  }
}

Future<NewsHeadlines> getNewsHeadlinesV3({
  required int page,
  required int pageSize,
}) async {
  String url =
      '${baseUrl}top-headlines?country=us&apiKey=$apiKey&page=$page&pageSize=$pageSize';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsHeadlines.fromJson(jsonDecode(response.body));
    } else {
      throw '${response.body} - Error: failed to get headlines';
    }
  } on SocketException {
    throw 'It seems you are not connected to the internet';
  } catch (e) {
    throw e.toString();
  }
}
