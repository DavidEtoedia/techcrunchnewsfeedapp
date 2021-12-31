// import 'package:food_app/core/controller/generic_state_notifier.dart';
// import 'package:food_app/core/repository/news_article_repo.dart';
// import 'package:food_app/core/services/api/Model/news_model.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final newsStreamProvider =
//     StateNotifierProvider.autoDispose<NewsStreamVM, RequestState>(
//   (ref) => NewsStreamVM(ref),
// );

// class NewsStreamVM extends RequestStateNotifier {
//   final NewsRepository _newsRepository;

//   NewsStreamVM(ref) : _newsRepository = ref.read(newsProvider) {
//     getStream();
//   }
//   void getStream() => makeRequest(() => _newsRepository.newsStream());
// }
