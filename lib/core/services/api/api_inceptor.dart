import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString(Constants.token);

    if (options.headers.containsKey('requireToken')) {
      // options.headers.addAll({"Authorization": "Bearer $token"});
      // remove the auxilliary header
      options.headers.remove('requireToken');
    } else {
      options.headers.remove('requireToken');
    }

    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final refreshToken = prefs.getString(Constants.refreshToken);

    // return response.data;
  }
  // return super.onError(err, handler);
}
// }

// @override
// Future onError(DioError err, ErrorInterceptorHandler handler) async {
//   final dio = Dio();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString(Constants.token);
//   final refreshToken = prefs.getString(Constants.refreshToken);
//   // final accessToken = prefs.getString(Constants.accessToken);
//   // const url = 'http://54.155.204.222/SpineAccounts/api/Account/refresh-token';
//   // print(err.response!.statusCode);

//   if (err.response?.statusCode == 401) {
//     final refreshToken = prefs.getString(Constants.refreshToken);
//     refToken(String refreshToken) async {
//       const url =
//           'http://54.155.204.222/SpineAccounts/api/Account/refresh-token';
//       try {
//         final response = await dio.post(
//           url,
//           data: {
//             "refreshToken": refreshToken,
//           },
//         );

//         final newtoken = prefs.setString(Constants.newAccessToken,
//             NewAccessToken.fromJson(response.data).token);
//         return NewAccessToken.fromJson(response.data);
//       } on DioError catch (e) {
//         if (e.response != null) {
//           Failure result = Failure.fromJson(e.response!.data);
//           // throw result.message!;

//         } else {
//           print(e.error);
//           throw e.error;
//         }
//       }
//     }

//     try {
//       refToken(refreshToken!);

//       if (err.response!.statusCode == 200) {
//         final freshToken = prefs.getString(Constants.newAccessToken);
//         print("token" + freshToken!);
//         err.requestOptions.headers["Authorization"] = "Bearer" + freshToken;
//         final opt = Options(
//             method: err.requestOptions.method,
//             headers: err.requestOptions.headers);
//         final cloneReq = await dio.request(err.requestOptions.path,
//             options: opt,
//             data: err.requestOptions.data,
//             queryParameters: err.requestOptions.queryParameters);
//         return handler.resolve(cloneReq);
//       }
//       // dio
//       // .post(url, data: jsonEncode({"refreshToken": refreshToken}))
//       //     .then((value) async {
//       //   // print(value.statusCode);
//       //   print(err.response!.statusCode);

//       //   return err.error;
//       //   // return handler.next(err);
//       // }

//       // );

//       // return dio;
//     } catch (err) {
//       print('i got here');
//     }
//   }

//   return super.onError(err, handler);
// }

@override
Future onResponse(Response response, ResponseInterceptorHandler handler) async {
  // print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
  print("Headers:");
  response.headers.forEach((k, v) => print('$k: $v'));
  print("Response: ${response.data}");
  print("<-- END HTTP");
  // }
  return handler.next(response);
}
