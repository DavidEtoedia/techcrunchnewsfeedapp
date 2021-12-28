import 'package:food_app/core/controller/generic_state_notifier.dart';
import 'package:food_app/core/repository/news_article_repo.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allNewsArticleProvider = StateNotifierProvider.autoDispose<NewsArticleVM,
    RequestState<GeneralCategory>>(
  (ref) => NewsArticleVM(ref),
);

class NewsArticleVM extends RequestStateNotifier<GeneralCategory> {
  final NewsRepository _newsRepository;

  NewsArticleVM(ref) : _newsRepository = ref.read(newsProvider) {
    getNews();
  }
  void getNews() => makeRequest(() => _newsRepository.getNews());
}
