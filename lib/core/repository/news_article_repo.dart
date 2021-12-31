import 'package:food_app/core/repository/I_news_repo.dart';
import 'package:food_app/core/services/api/Model/live_feed.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';
import 'package:food_app/core/services/api/news_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsProvider = Provider<NewsRepository>((ref) {
  final newsService = ref.watch(newsServiceProvider);
  return NewsRepository(newsService);
});

class NewsRepository extends INewsRepository {
  final NewsService _newsService;
  NewsRepository(this._newsService);

  @override
  Future<GeneralCategory> getNews(String country) async {
    final newsRes = await _newsService.getNews(country);
    return newsRes;
  }

  @override
  Future<Category> techCategory(String country) async {
    final techNews = await _newsService.techCategory(country);
    return techNews;
  }

  @override
  Future<Category> sportCategory(String country) async {
    final sportNews = await _newsService.sportCategory(country);
    return sportNews;
  }

  @override
  Future<Category> businessCategory(String country) async {
    final healthNews = await _newsService.businessCategory(country);
    return healthNews;
  }

  @override
  Future<LiveFeed> newsFeed() async {
    final liveFeed = _newsService.newsFeed();
    return liveFeed;
  }

  // @override
  // Future<NewArticle> newsFeed() async {
  //   final newsFeed = await _newsService.newsFeed();
  //   return newsFeed;
  // }
}
