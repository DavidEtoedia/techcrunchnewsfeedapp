import 'package:food_app/core/repository/I_news_repo.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
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
  Future<NewArticle> getNews() async {
    final newsRes = await _newsService.getNews();
    return newsRes;
  }

  @override
  Future<NewArticle> techCategory() async {
    final techNews = await _newsService.techCategory();
    return techNews;
  }

  @override
  Future<NewArticle> sportCategory() async {
    final sportNews = await _newsService.sportCategory();
    return sportNews;
  }

  @override
  Future<NewArticle> healthCategory() async {
    final healthNews = await _newsService.healthCategory();
    return healthNews;
  }
}
