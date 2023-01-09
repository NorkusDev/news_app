// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:news_app/src/core/core.dart';
import 'package:news_app/src/data/models/news_model.dart';

abstract class NewsLocalDataSource {
  Future<void> cacheTrending(NewsModel news);
  Future<NewsModel> getTrending();
  Future<void> cacheHot(NewsModel news);
  Future<NewsModel> getHotNews();
  Future<void> cacheRecommendation(NewsModel news);
  Future<NewsModel> getRecommendation();
}

const CACHE_TRENDING = 'CACHE_TRENDING';
const CACHE_RECOMMENDATION = 'CACHE_RECOMMENDATION';
const CACHE_HOT = 'CACHE_HOT';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final StorageHelper storage;
  NewsLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<void> cacheTrending(NewsModel news) async {
    await storage.write(
      StorageItems(
        key: CACHE_TRENDING,
        value: json.encode(
          news.toJson(),
        ),
      ),
    );
    return;
  }

  @override
  Future<NewsModel> getTrending() async {
    final jsonString = await storage.read(CACHE_TRENDING);
    if (jsonString != null) {
      return NewsModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheHot(NewsModel news) async {
    await storage.write(
      StorageItems(
        key: CACHE_HOT,
        value: json.encode(
          news.toJson(),
        ),
      ),
    );
    return;
  }

  @override
  Future<NewsModel> getHotNews() async {
    final jsonString = await storage.read(CACHE_HOT);
    if (jsonString != null) {
      return NewsModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheRecommendation(NewsModel news) async {
    await storage.write(
      StorageItems(
        key: CACHE_RECOMMENDATION,
        value: json.encode(
          news.toJson(),
        ),
      ),
    );
    return;
  }

  @override
  Future<NewsModel> getRecommendation() async {
    final jsonString = await storage.read(CACHE_RECOMMENDATION);
    if (jsonString != null) {
      return NewsModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }
}
