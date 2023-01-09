import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/src/domain/entitites/news_entities.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String status;
  @JsonKey(name: "totalResults")
  final int total;
  List<NewsArticleModel> articles;
  NewsModel({
    required this.status,
    required this.total,
    required this.articles,
  });

  NewsEntities toEntity() => NewsEntities(
        status: status,
        total: total,
        articles: articles
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
      );

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleModel {
  final NewsArticleSourceModel source;
  @JsonKey(defaultValue: "Antonio Fernandez")
  final String author;
  @JsonKey(defaultValue: "")
  final String title;
  @JsonKey(defaultValue: "")
  final String description;
  @JsonKey(defaultValue: "")
  final String url;
  @JsonKey(defaultValue: "")
  final String urlToImage;
  final DateTime publishedAt;
  @JsonKey(defaultValue: "")
  final String content;
  NewsArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  NewsArticleEntities toEntity() => NewsArticleEntities(
        source: source.toEntity(),
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleSourceModel {
  @JsonKey(name: "id", defaultValue: "")
  final String id;
  @JsonKey(name: "name", defaultValue: "")
  final String name;

  NewsArticleSourceModel({
    required this.id,
    required this.name,
  });

  NewsArticleSourceEntities toEntity() =>
      NewsArticleSourceEntities(id: id, name: name);

  factory NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleSourceModelToJson(this);
}
