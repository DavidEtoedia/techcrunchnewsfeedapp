// To parse this JSON data, do
//
//     final failure = failureFromJson(jsonString);

import 'dart:convert';

Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

String failureToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.error,
  });

  Error? error;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
      };
}

class Error {
  Error({
    this.code,
    this.message,
    this.context,
  });

  String? code;
  String? message;
  Context? context;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        context: Context.fromJson(json["context"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "context": context!.toJson(),
      };
}

class Context {
  Context({
    this.date,
  });

  List<String>? date;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        date: List<String>.from(json["date"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": List<dynamic>.from(date!.map((x) => x)),
      };
}
