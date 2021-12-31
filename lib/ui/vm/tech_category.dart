import 'package:food_app/core/controller/generic_state_notifier.dart';
import 'package:food_app/core/repository/news_article_repo.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:food_app/core/services/api/Model/news_category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final techProvider =
    StateNotifierProvider.autoDispose<NewsArticleVM, RequestState<Category>>(
  (ref) {
    ref.maintainState = true;
    return NewsArticleVM(ref);
  },
);

class NewsArticleVM extends RequestStateNotifier<Category> {
  final NewsRepository _newsRepository;

  NewsArticleVM(ref) : _newsRepository = ref.read(newsProvider) {
    techTab();
  }
  void techTab() => makeRequest(() => _newsRepository.techCategory());
}
