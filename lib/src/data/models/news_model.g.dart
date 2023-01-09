// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      status: json['status'] as String,
      total: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.total,
      'articles': instance.articles,
    };

NewsArticleModel _$NewsArticleModelFromJson(Map<String, dynamic> json) =>
    NewsArticleModel(
      source: NewsArticleSourceModel.fromJson(
          json['source'] as Map<String, dynamic>),
      author: json['author'] as String? ?? 'Antonio Fernandez',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String? ?? '',
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$NewsArticleModelToJson(NewsArticleModel instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };

NewsArticleSourceModel _$NewsArticleSourceModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleSourceModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$NewsArticleSourceModelToJson(
        NewsArticleSourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
