import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  const DatabaseService._();

  static late final Box<Uint8List> mediaBox;
  static late final Box<Uint8List> articleBox;
  static late final Box<Uint8List> categoryBox;

  static late final Box settingsBox;

  static Future<void> developementService() async {
    await Hive.initFlutter();
    const collection = 'news_developement';
    await _openAllBox(collection);
  }

  static Future<void> productionService() async {
    await Hive.initFlutter();
    const collection = 'news_production';
    await _openAllBox(collection);
  }

  static Future<Box<E>> _openBox<E>(String name, String collection) async {
    return Hive.openBox<E>(
      name,
      collection: collection,
      compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 50;
      },
    );
  }

  static Future<void> _openAllBox(String collection) async {
    mediaBox = await _openBox('media_box', collection);
    articleBox = await _openBox('article_box', collection);
    categoryBox = await _openBox('category_box', collection);
    settingsBox = await _openBox('settings_box', collection);
  }
}
