// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NewsApiService extends NewsApiService {
  _$NewsApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsApiService;

  @override
  Future<Response<NetworkResult<NewsResponse>>> getTopHeadlines(
      {String country = 'us'}) {
    final $url = 'top-headlines';
    final $params = <String, dynamic>{'country': country};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<NetworkResult<NewsResponse>, NewsResponse>($request);
  }

  @override
  Future<Response<NetworkResult<NewsResponse>>> getEveryThing(String query) {
    final $url = 'everything';
    final $params = <String, dynamic>{'q': query};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<NetworkResult<NewsResponse>, NewsResponse>($request);
  }
}
