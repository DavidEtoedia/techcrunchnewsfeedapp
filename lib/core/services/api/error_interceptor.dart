import 'package:dio/dio.dart';
import 'package:food_app/core/services/utils/http_Utils/http_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    err = await HttpUtils.buildErrorResponse(err);
    // if (err.response?.statusCode = 401) {
    //   final token = _userService.refreshToken(refreshToken);
    // }
    return super.onError(err, handler);
  }
}
