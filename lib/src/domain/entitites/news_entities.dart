import 'package:equatable/equatable.dart';
import 'package:news_app/src/data/models/news_model.dart';

class NewsEntities extends Equatable {
  final String status;
  final int total;
  final List<NewsArticleEntities> articles;
  const NewsEntities({
    required this.status,
    required this.total,
    required this.articles,
  });

  NewsModel toModel() => NewsModel(
        status: status,
        total: total,
        articles: articles.map((e) => e.toModel()).toList(),
      );

  @override
  List<Object> get props => [status, total, articles];
}

class NewsArticleEntities extends Equatable {
  final NewsArticleSourceEntities source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  const NewsArticleEntities({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  NewsArticleModel toModel() => NewsArticleModel(
      author: author,
      content: content,
      description: description,
      publishedAt: publishedAt,
      source: source.toModel(),
      title: title,
      url: url,
      urlToImage: urlToImage);

  @override
  List<Object> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}

class NewsArticleSourceEntities extends Equatable {
  final String id;
  final String name;
  const NewsArticleSourceEntities({
    required this.id,
    required this.name,
  });

  NewsArticleSourceModel toModel() =>
      NewsArticleSourceModel(id: id, name: name);
  @override
  List<Object> get props => [id, name];
}
