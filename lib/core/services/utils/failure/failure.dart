// To parse this JSON data, do
//
//     final errorData = errorDataFromJson(jsonString);

import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
  ErrorData({
    this.status,
    this.code,
    this.message,
  });

  String? status;
  String? code;
  String? message;

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
