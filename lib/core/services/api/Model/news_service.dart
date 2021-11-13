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
        'top-headlines?sources=techcrunch&apiKey=4afd7897032e43419f559a8308a7d094';
    try {
      final response = await dio.get(
        url,
      );
      final result = NewArticle.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        throw result;
      } else {
        throw e.error;
      }
    }
  }
}
