import 'dart:async';

import 'package:dio/dio.dart';
import 'package:food_app/core/services/api/Model/live_feed.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';
import 'package:food_app/core/services/api/api_inceptor.dart';
import 'package:food_app/core/services/api/error_interceptor.dart';
import 'package:food_app/core/services/global/constant.dart';
import 'package:food_app/core/services/utils/failure/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService(ref.watch(dioProvider));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    baseUrl: Constant.baseUrl)));

class NewsService {
  final Dio dio;
  NewsService(this.dio) {
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<GeneralCategory> getNews(String country) async {
    final url =
        'top-headlines?country=$country&category=general&apiKey=${Constant.apiKey}';
    try {
      final response = await dio.get(
        url,
      );
      final result = GeneralCategory.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<Category> sportCategory(String country) async {
    final url =
        'top-headlines?country=$country&category=sports&apiKey=${Constant.apiKey}';
    try {
      final response = await dio.get(
        url,
      );
      final result = Category.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<Category> techCategory(String country) async {
    final url =
        'top-headlines?country=$country&category=technology&apiKey=${Constant.apiKey}';
    try {
      final response = await dio.get(
        url,
      );
      final result = Category.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<Category> businessCategory(String country) async {
    final url =
        'top-headlines?country=$country&category=business&apiKey=${Constant.apiKey}';
    try {
      final response = await dio.get(
        url,
      );
      final result = Category.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<LiveFeed> newsFeed() async {
    final url =
        'top-headlines?sources=bbc-news,techcrunch,techradar&apiKey=${Constant.apiKey}';
    try {
      final response = await dio.get(
        url,
      );
      final result = LiveFeed.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        print(result.message);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }
}
