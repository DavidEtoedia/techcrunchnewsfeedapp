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

  Future<GeneralCategory> getNews() async {
    final url =
        'top-headlines?country=us&category=general&apiKey=${Constant.apiKey}';
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

  // Future<NewArticle> techCategory() async {
  //   final url =
  //       'news?access_key=59c279f8f930e95543e11924d03039a6&categories=technology&languages=en';
  //   try {
  //     final response = await dio.get(
  //       url,
  //     );
  //     final result = NewArticle.fromJson(response.data);
  //     return result;
  //   } on DioError catch (e) {
  //     if (e.response != null && e.response!.data != '') {
  //       Failure result = Failure.fromJson(e.response!.data);
  //       throw result.error!.message!;
  //     } else {
  //       throw e.error;
  //     }
  //   }
  // }

  Future<Category> sportCategory() async {
    final url =
        'top-headlines?country=us&category=sports&apiKey=${Constant.apiKey}';
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

  Future<Category> techCategory() async {
    final url =
        'top-headlines?country=us&category=technology&apiKey=${Constant.apiKey}';
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

  Future<Category> businessCategory() async {
    final url =
        'top-headlines?country=us&category=business&apiKey=${Constant.apiKey}';
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
