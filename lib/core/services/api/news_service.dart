import 'package:dio/dio.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
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
    receiveTimeout: 100000, connectTimeout: 100000, baseUrl: Constant.apiUrl)));

class NewsService {
  final Dio dio;
  NewsService(this.dio) {
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<NewArticle> getNews() async {
    final url =
        'news?access_key=59c279f8f930e95543e11924d03039a6&%20sources=cnn,bbc,techcrunch';
    try {
      final response = await dio.get(
        url,
      );
      final result = NewArticle.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<NewArticle> techCategory() async {
    final url =
        'news?access_key=59c279f8f930e95543e11924d03039a6&categories=technology&languages=en';
    try {
      final response = await dio.get(
        url,
      );
      final result = NewArticle.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<NewArticle> sportCategory() async {
    final url =
        'news?access_key=59c279f8f930e95543e11924d03039a6&categories=sports&languages=en';
    try {
      final response = await dio.get(
        url,
      );
      final result = NewArticle.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!.message!;
      } else {
        throw e.error;
      }
    }
  }

  Future<NewArticle> healthCategory() async {
    final url =
        'news?access_key=59c279f8f930e95543e11924d03039a6&categories=health&languages=en';
    try {
      final response = await dio.get(
        url,
      );
      final result = NewArticle.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!.message!;
      } else {
        throw e.error;
      }
    }
  }
}
