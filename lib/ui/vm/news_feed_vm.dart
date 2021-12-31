import 'dart:async';

import 'package:food_app/core/controller/generic_state_notifier.dart';
import 'package:food_app/core/repository/news_article_repo.dart';
import 'package:food_app/core/services/api/Model/live_feed.dart';
import 'package:food_app/core/services/api/Model/news_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newsFeedProvider =
    StateNotifierProvider.autoDispose<NewsFeedVM, RequestState<LiveFeed>>(
  (ref) => NewsFeedVM(ref),
);

class NewsFeedVM extends RequestStateNotifier<LiveFeed> {
  final NewsRepository _newsRepository;

  NewsFeedVM(ref) : _newsRepository = ref.read(newsProvider) {
    getNewsFeed();
  }

  void getNewsFeed() => makeRequest(() => _newsRepository.newsFeed());
}
