import 'dart:convert';
import 'dart:io';

import 'package:food_app/Model/news_model.dart';
import 'package:food_app/Util/failure.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Future<List<Article>> getData() async {
    try {
      final endPoint = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4afd7897032e43419f559a8308a7d094"));

      if (endPoint.statusCode == 200) {
        final json = jsonDecode(endPoint.body);
        return NewArticle.fromJson(json).articles;
      }
    } on SocketException {
      throw Failure(message: 'Your are not connected to the internet');
    } catch (error) {
      throw Failure(message: 'Unknown error');
    }
  }
}
