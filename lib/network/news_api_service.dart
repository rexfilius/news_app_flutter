import 'package:chopper/chopper.dart';
import 'package:news_app_flutter/news_app.dart';

part 'news_api_service.chopper.dart';

const String newsApiKey = "596e717696ed47c8b51a069900741da0";
const String newsApiUrl = "https://newsapi.org/v2/";
// top headlines = top-headlines?country=us&apiKey=596e717696ed47c8b51a069900741da0
// everything = everything?q=bitcoin&apiKey=596e717696ed47c8b51a069900741da0

@ChopperApi()
abstract class NewsApiService extends ChopperService {
  @Get(path: 'top-headlines')
  Future<Response<NetworkResult<NewsResponse>>> getTopHeadlines(
      {@Query('country') String country = 'us'});

  @Get(path: 'everything')
  Future<Response<NetworkResult<NewsResponse>>> getEveryThing(
      @Query('q') String query);

  /// Creating an instance of the service that will fetch the news articles
  static NewsApiService create() {
    final client = ChopperClient(
        baseUrl: newsApiUrl,
        interceptors: [_addQuery, HttpLoggingInterceptor()],
        converter: ModelConverter(),
        errorConverter: const JsonConverter(),
        services: [
          _$NewsApiService(),
        ]);
    return _$NewsApiService(client);
  }
}

Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  params['apiKey'] = newsApiKey;
  return req.copyWith(parameters: params);
}
