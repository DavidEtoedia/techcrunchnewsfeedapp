// To parse this JSON data, do
//
//     final newArticle = newArticleFromJson(jsonString);

import 'dart:convert';

NewArticle newArticleFromJson(String str) =>
    NewArticle.fromJson(json.decode(str));

String newArticleToJson(NewArticle data) => json.encode(data.toJson());

class NewArticle {
  NewArticle({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory NewArticle.fromJson(Map<String, dynamic> json) => NewArticle(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  Id? id;
  Name? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
      };
}

enum Id { TECHCRUNCH }

final idValues = EnumValues({"techcrunch": Id.TECHCRUNCH});

enum Name { TECH_CRUNCH }

final nameValues = EnumValues({"TechCrunch": Name.TECH_CRUNCH});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
