import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:pod_player/pod_player.dart';

import 'service.dart';

class NewsService extends ValueNotifier<NewsState> {
  NewsService([
    NewsState value = const InitNewsState(),
  ]) : super(value);

  static NewsService? _instance;
  static NewsService get instance {
    return _instance ??= NewsService();
  }

  Future<void> handle(NewsEvent event) => event._execute(this);
}

abstract class NewsEvent {
  const NewsEvent();

  Future<void> _execute(NewsService service);

  Box<Uint8List> get _categoryBox => DatabaseService.categoryBox;
  Box<Uint8List> get _articleBox => DatabaseService.articleBox;
  Box<Uint8List> get _mediaBox => DatabaseService.mediaBox;

  static int sortByDate(Timestamp a, Timestamp b) {
    return b.toDateTime().compareTo(a.toDateTime());
  }

  static PlayVideoFrom getController(MediaPost post) {
    switch (post.type) {
      case MediaPost_Type.YOUTUBE:
        return PlayVideoFrom.youtube(
          post.content,
          live: post.live,
        );
      default:
        return PlayVideoFrom.network(post.content);
    }
  }
}

///
///
///
class FetchArticlePostList extends NewsEvent {
  const FetchArticlePostList({
    this.category,
    this.page = 1,
  });

  final String? category;
  final int page;

  String get _url {
    var value = '${RepositoryService.basicURL}/news/article/post';
    if (category != null) value += '?category=$category&page=$page';
    return value;
  }

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final response = (await get(Uri.parse(_url)));
      switch (response.statusCode) {
        case 200:
          final proto = await compute(
            ArticlePostListResponse.fromBuffer,
            response.bodyBytes,
          );
          final data = proto.data;
          data.sort((a, b) => NewsEvent.sortByDate(a.date, b.date));
          service.value = ArticlePostListNewsState(data: data, page: page);
          break;
        default:
          log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class StreamArticlePostList extends NewsEvent {
  const StreamArticlePostList();

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      final boxListenable = _articleBox.listenable();
      boxListenable.addListener(() async {
        await service.handle(const GetArticlePostList());
      });
      await service.handle(const GetArticlePostList());
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class GetArticlePostList extends NewsEvent {
  const GetArticlePostList();

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final values = _articleBox.values;
      final data = values.map((e) => ArticlePost.fromBuffer(e)).toList();
      data.sort((a, b) => NewsEvent.sortByDate(a.date, b.date));
      service.value = ArticlePostListNewsState(data: data);
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class SetArticlePost extends NewsEvent {
  const SetArticlePost({
    required this.data,
  });

  final ArticlePost data;

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      await _articleBox.put(data.link, data.writeToBuffer());
      service.value = ArticlePostNewsState(data: data);
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class GetArticlePost extends NewsEvent {
  const GetArticlePost({
    required this.data,
  });

  final ArticlePost data;

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      final value = _articleBox.get(data.link);
      if (value != null) {
        final data = ArticlePost.fromBuffer(value);
        service.value = ArticlePostNewsState(data: data);
      } else {
        service.value = FailureNewsState(event: this);
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class DeleteArticlePostList extends NewsEvent {
  const DeleteArticlePostList({
    required this.data,
  });

  final ArticlePost data;

  static Future<void> execute(ArticlePost data) {
    return NewsService().handle(DeleteArticlePostList(data: data));
  }

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      await _articleBox.delete(data.link);
      service.value = ArticlePostNewsState(data: data);
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class FetchArticleContent extends NewsEvent {
  const FetchArticleContent({
    required this.source,
    required this.link,
  });

  final String source;
  final String link;

  String get _url => '${RepositoryService.basicURL}/news/article/content'
      '?source=$source&link=$link';

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      final response = (await get(Uri.parse(_url)));
      switch (response.statusCode) {
        case 200:
          final proto = await compute(
            ArticlePostResponse.fromBuffer,
            response.bodyBytes,
          );
          final data = proto.data;
          service.value = ArticlePostNewsState(data: data);
          break;
        default:
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

///
///
///
class FetchMediaPostList extends NewsEvent {
  const FetchMediaPostList({
    this.category,
    this.page = 1,
  });

  final String? category;
  final int page;

  String get _url {
    var value = '${RepositoryService.basicURL}/news/media/post';
    if (category != null) value += '?category=$category&page=$page';
    return value;
  }

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final response = (await get(Uri.parse(_url)));
      switch (response.statusCode) {
        case 200:
          final proto = await compute(
            MediaPostListResponse.fromBuffer,
            response.bodyBytes,
          );
          final data = proto.data;
          data.sort((a, b) => NewsEvent.sortByDate(a.date, b.date));
          final services = List.of(data.map((e) => NewsService()));
          final controllers = List.generate(data.length, (index) {
            return ValueNotifier(PodPlayerController(
              playVideoFrom: NewsEvent.getController(data[index]),
            ));
          });
          service.value = MediaPostListNewsState(
            controllers: controllers,
            services: services,
            data: data,
            page: page,
          );
          break;
        default:
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class StreamMediaPostList extends NewsEvent {
  const StreamMediaPostList();

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final boxListenable = _mediaBox.listenable();
      boxListenable.addListener(() async {
        await service.handle(const GetMediaPostList());
      });
      await service.handle(const GetMediaPostList());
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class GetMediaPostList extends NewsEvent {
  const GetMediaPostList();

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final values = _mediaBox.values;
      final data = values.map((e) => MediaPost.fromBuffer(e)).toList();
      data.sort((a, b) => NewsEvent.sortByDate(a.date, b.date));
      final services = List.of(data.map((e) => NewsService()));
      final controllers = List.generate(data.length, (index) {
        return ValueNotifier(PodPlayerController(
          playVideoFrom: NewsEvent.getController(data[index]),
        ));
      });
      service.value = MediaPostListNewsState(
        controllers: controllers,
        services: services,
        data: data,
      );
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class FetchMediaContent extends NewsEvent {
  const FetchMediaContent({
    required this.source,
    required this.link,
  });

  final String source;
  final String link;

  String get _url => '${RepositoryService.basicURL}/news/media/content'
      '?source=$source&link=$link';

  @override
  Future<void> _execute(NewsService service) async {
    service.value = const PendingNewsState();
    try {
      final response = (await get(Uri.parse(_url)));
      switch (response.statusCode) {
        case 200:
          final proto = await compute(
            MediaPostResponse.fromBuffer,
            response.bodyBytes,
          );
          final data = proto.data;
          service.value = MediaPostNewsState(data: data);
          break;
        default:
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

///
///
///
class FetchNewsCategories extends NewsEvent {
  const FetchNewsCategories({
    required this.gender,
  });

  final String gender;

  String get _url => '${RepositoryService.basicURL}/news/categories'
      '?gender=$gender';

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final response = (await get(Uri.parse(_url)));
      switch (response.statusCode) {
        case 200:
          final proto = await compute(
            NewsCategoryListResponse.fromBuffer,
            response.bodyBytes,
          );
          final data = proto.data;
          service.value = CategoryListNewsState(data: data);
          break;
        default:
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class GetNewsCategories extends NewsEvent {
  const GetNewsCategories({
    required this.gender,
  });

  final String gender;

  @override
  Future<void> _execute(NewsService service) async {
    try {
      final value = _categoryBox.get(gender);
      if (value != null) {
        final proto = NewsCategoryListResponse.fromBuffer(value);
        service.value = CategoryListNewsState(data: proto.data);
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}

class SetNewsCategories extends NewsEvent {
  const SetNewsCategories({
    required this.categories,
    required this.gender,
  });

  final List<NewsCategory> categories;
  final String gender;

  @override
  Future<void> _execute(NewsService service) async {
    try {
      if (!_categoryBox.containsKey(gender)) {
        final proto = NewsCategoryListResponse(data: categories);
        await _categoryBox.put(gender, proto.writeToBuffer());
      }
    } catch (e) {
      log(e.toString());
      service.value = FailureNewsState(event: this);
    }
  }
}
