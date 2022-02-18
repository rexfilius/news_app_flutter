import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:news_app_flutter/models/news_article_model.dart';
import 'package:news_app_flutter/network/model_response.dart';

/// Adding the API key to a request or transforming the response into data
/// objects, is a job for converters and interceptors!
///
/// To use the returned API data, you need a converter to transform requests
/// and responses. To attach a converter to a Chopper client,
/// you need an interceptor.
///
/// You can think of an interceptor as a function that runs every time
/// you send a request or receive a response — a sort of hook to which
/// you can attach functionalities, like converting/decorating data,
/// before passing such data along.

class ModelConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );
    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }

    try {
      final mapData = json.decode(body);
      if (mapData['status'] != null) {
        return response.copyWith<BodyType>(
            body: Error(Exception(mapData['status'])) as BodyType);
      }

      final newsResponse = NewsResponse.fromJson(mapData);
      return response.copyWith<BodyType>(
          body: Success(newsResponse) as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
          body: Error(e as Exception) as BodyType);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }
}
