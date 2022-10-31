import 'package:flutter/foundation.dart';
import 'package:pod_player/pod_player.dart';

import 'service.dart';

class NewsState {
  const NewsState();
}

class InitNewsState extends NewsState {
  const InitNewsState();
}

class PendingNewsState extends NewsState {
  const PendingNewsState();
}

class FailureNewsState extends NewsState {
  const FailureNewsState({
    this.event,
  });
  final NewsEvent? event;
}

class ArticlePostListNewsState extends NewsState {
  const ArticlePostListNewsState({
    required this.data,
    this.page = 1,
  });
  final List<ArticlePost> data;
  final int page;
}

class ArticlePostNewsState extends NewsState {
  const ArticlePostNewsState({
    required this.data,
  });
  final ArticlePost data;
}

class MediaPostListNewsState extends NewsState {
  const MediaPostListNewsState({
    required this.controllers,
    required this.services,
    required this.data,
    this.page = 1,
  });
  final List<ValueNotifier<PodPlayerController>> controllers;
  final List<NewsService> services;
  final List<MediaPost> data;
  final int page;
}

class MediaPostNewsState extends NewsState {
  const MediaPostNewsState({
    required this.data,
  });

  final MediaPost data;
}

class CategoryListNewsState extends NewsState {
  const CategoryListNewsState({
    required this.data,
  });
  final List<NewsCategory> data;
}
