import 'dart:convert';

import '../../../core/core.dart';
import '../../models/news_model.dart';

abstract class BookmarkLocalDataSource {
  Future<bool> addBookmark(NewsModel news);
  Future<bool> removeBookmark(NewsModel news);
  Future<NewsModel> readBookmark();
}

const CACHED_BOOKMARK = "CACHED_BOOKMARK";

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  final StorageHelper storage;

  BookmarkLocalDataSourceImpl(this.storage);

  @override
  Future<bool> addBookmark(NewsModel news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (jsonString != null) {
      NewsModel cache = NewsModel.fromJson(json.decode(jsonString));
      final List<NewsArticleModel> data = news.articles;

      for (var element in cache.articles) {
        if (data[0].title.contains(element.title)) {
          return false;
        }
      }

      cache.articles = news.articles + cache.articles;

      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(
            cache.toJson(),
          ),
        ),
      );
      return true;
    } else {
      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(
            news.toJson(),
          ),
        ),
      );
      return true;
    }
  }

  @override
  Future<bool> removeBookmark(NewsModel news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);

    if (jsonString != null) {
      NewsModel cache = NewsModel.fromJson(json.decode(jsonString));
      final List<NewsArticleModel> data = news.articles;

      cache.articles.removeWhere((element) => element.title == data[0].title);

      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(
            cache.toJson(),
          ),
        ),
      );
      return true;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<NewsModel> readBookmark() async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (jsonString != null) {
      return NewsModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }
}
