import 'package:food_app/core/services/api/Model/live_feed.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';

abstract class INewsRepository {
  Future<GeneralCategory> getNews();
  Future<LiveFeed> newsFeed();
  Future<Category> techCategory();
  Future<Category> sportCategory();
  Future<Category> businessCategory(String country);
}
