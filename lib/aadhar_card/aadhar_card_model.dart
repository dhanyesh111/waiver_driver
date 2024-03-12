// To parse this JSON data, do
//
//     final uploadAadharResponseModel = uploadAadharResponseModelFromJson(jsonString);

import 'dart:convert';

UploadAadharResponseModel uploadAadharResponseModelFromJson(String str) =>
    UploadAadharResponseModel.fromJson(json.decode(str));

String uploadAadharResponseModelToJson(UploadAadharResponseModel data) =>
    json.encode(data.toJson());

class UploadAadharResponseModel {
  int? status;
  String? message;
  Data? data;

  UploadAadharResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UploadAadharResponseModel.fromJson(Map<String, dynamic> json) =>
      UploadAadharResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<String>? aadhar;

  Data({
    this.aadhar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aadhar: json["aadhar"] == null
            ? []
            : List<String>.from(json["aadhar"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aadhar":
            aadhar == null ? [] : List<dynamic>.from(aadhar!.map((x) => x)),
      };
}
