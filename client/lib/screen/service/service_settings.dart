import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import 'service.dart';

class SettingsService {
  const SettingsService._();

  static Box get _box => DatabaseService.settingsBox;

  static final _articleKey = NewsType.article.name;

  static Stream<int> get streamArticleCategoryIndex {
    final controller = StreamController<int>();
    _box.listenable(keys: [_articleKey]).addListener(() {
      controller.add(getArticleCategoryIndex);
    });
    return controller.stream;
  }

  static int get getArticleCategoryIndex {
    return _box.get(_articleKey, defaultValue: 0);
  }

  static void setArticleCategoryIndex(int value) {
    _box.put(_articleKey, value);
  }

  static final _mediaKey = NewsType.media.name;

  static Stream<int> get streamMediaCategoryIndex {
    final controller = StreamController<int>();
    _box.listenable(keys: [_mediaKey]).addListener(() {
      controller.add(getMediaCategoryIndex);
    });
    return controller.stream;
  }

  static int get getMediaCategoryIndex {
    return _box.get(_mediaKey, defaultValue: 0);
  }

  static void setMediaCategoryIndex(int value) {
    _box.put(_mediaKey, value);
  }
}
