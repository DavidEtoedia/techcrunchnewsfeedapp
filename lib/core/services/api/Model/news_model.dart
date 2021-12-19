// To parse this JSON data, do
//
//     final newArticle = newArticleFromJson(jsonString);

import 'dart:convert';

NewArticle newArticleFromJson(String str) =>
    NewArticle.fromJson(json.decode(str));

String newArticleToJson(NewArticle data) => json.encode(data.toJson());

class NewArticle {
  NewArticle({
    // this.pagination,
    required this.data,
  });

  // Pagination pagination;
  List<Datum> data;

  factory NewArticle.fromJson(Map<String, dynamic> json) => NewArticle(
        // pagination: Pagination.fromJson(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    this.category,
    // this.language,
    // this.country,
    required this.publishedAt,
  });

  String title;
  String description;
  String url;
  String source;
  String image;
  Category? category;
  // Language language;
  // Country country;
  DateTime publishedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        source: json["source"],
        image: json["image"] == null ? '' : json["image"],
        category: categoryValues.map[json["category"]],
        // language: languageValues.map[json["language"]],
        // country: countryValues.map[json["country"]],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "source": source,
        "image": image == null ? '' : image,
        "category": categoryValues.reverse[category],
        // "language": languageValues.reverse[language],
        // "country": countryValues.reverse[country],
        "published_at": publishedAt.toIso8601String(),
      };
}

enum Category { GENERAL, TECHNOLOGY }

final categoryValues = EnumValues(
    {"general": Category.GENERAL, "technology": Category.TECHNOLOGY});

// enum Country { US, GB }

// final countryValues = EnumValues({
//     "gb": Country.GB,
//     "us": Country.US
// });

// enum Language { EN }

// final languageValues = EnumValues({
//     "en": Language.EN
// });

// class Pagination {
//     Pagination({
//         this.limit,
//         this.offset,
//         this.count,
//         this.total,
//     });

//     int limit;
//     int offset;
//     int count;
//     int total;

//     factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         limit: json["limit"],
//         offset: json["offset"],
//         count: json["count"],
//         total: json["total"],
//     );

//     Map<String, dynamic> toJson() => {
//         "limit": limit,
//         "offset": offset,
//         "count": count,
//         "total": total,
//     };
// }

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
