// To parse this JSON data, do
//
//     final liveFeed = liveFeedFromJson(jsonString);

import 'dart:convert';

LiveFeed liveFeedFromJson(String str) => LiveFeed.fromJson(json.decode(str));

String liveFeedToJson(LiveFeed data) => json.encode(data.toJson());

class LiveFeed {
  LiveFeed({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<NewsFeed>? articles;

  factory LiveFeed.fromJson(Map<String, dynamic> json) => LiveFeed(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsFeed>.from(
            json["articles"].map((x) => NewsFeed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class NewsFeed {
  NewsFeed({
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

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
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

enum Id { TECHCRUNCH, BBC_NEWS, TECHRADAR }

final idValues = EnumValues({
  "bbc-news": Id.BBC_NEWS,
  "techcrunch": Id.TECHCRUNCH,
  "techradar": Id.TECHRADAR
});

enum Name { TECH_CRUNCH, BBC_NEWS, TECH_RADAR }

final nameValues = EnumValues({
  "BBC News": Name.BBC_NEWS,
  "TechCrunch": Name.TECH_CRUNCH,
  "TechRadar": Name.TECH_RADAR
});

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
