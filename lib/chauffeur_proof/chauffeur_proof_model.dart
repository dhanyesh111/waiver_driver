import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:waiver_driver/view_bank_account/view_bank_model.dart';

import '../enums/enums.dart';

class AddProofItemModel {
  String text;
  Rx<ChauffeurProofApprovalStatus> approvalStatus;
  AddProofItemModel({
    required this.text,
    required this.approvalStatus,
  });
}

// To parse this JSON data, do
//
//     final addBankAccountResponseModel = addBankAccountResponseModelFromJson(jsonString);

GetDocumentsResponseModel getDocumentsResponseModelFromJson(String str) =>
    GetDocumentsResponseModel.fromJson(json.decode(str));

String getDocumentsResponseModelToJson(GetDocumentsResponseModel data) =>
    json.encode(data.toJson());

class GetDocumentsResponseModel {
  int? status;
  String? message;
  List<ProofDocument>? data;

  GetDocumentsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetDocumentsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDocumentsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProofDocument>.from(
                json["data"]!.map((x) => ProofDocument.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProofDocument {
  String? id;
  List<FileElement>? files;
  String? documentType;
  bool? isVerified;
  bool? isValid;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? user;

  ProofDocument({
    this.id,
    this.files,
    this.documentType,
    this.isVerified,
    this.isValid,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ProofDocument.fromJson(Map<String, dynamic> json) => ProofDocument(
        id: json["id"],
        files: json["files"] == null
            ? []
            : List<FileElement>.from(
                json["files"]!.map((x) => FileElement.fromJson(x))),
        documentType: json["document_type"],
        isVerified: json["is_verified"],
        isValid: json["is_valid"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "files": files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toJson())),
        "document_type": documentType,
        "is_verified": isVerified,
        "is_valid": isValid,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
        "user": user,
      };
}

class FileElement {
  int? id;
  String? file;
  String? document;

  FileElement({
    this.id,
    this.file,
    this.document,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        file: json["file"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "document": document,
      };
}

///============================================================================>
// To parse this JSON data, do
//
//     final getProfilePhotoResponseModel = getProfilePhotoResponseModelFromJson(jsonString);

GetProfilePhotoResponseModel getProfilePhotoResponseModelFromJson(String str) =>
    GetProfilePhotoResponseModel.fromJson(json.decode(str));

String getProfilePhotoResponseModelToJson(GetProfilePhotoResponseModel data) =>
    json.encode(data.toJson());

class GetProfilePhotoResponseModel {
  int? status;
  String? message;
  ProfilePhotoModel? data;

  GetProfilePhotoResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetProfilePhotoResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProfilePhotoResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ProfilePhotoModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProfilePhotoModel {
  String? profileImage;

  ProfilePhotoModel({
    this.profileImage,
  });

  factory ProfilePhotoModel.fromJson(Map<String, dynamic> json) =>
      ProfilePhotoModel(
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "profile_image": profileImage,
      };
}

// To parse this JSON data, do
//
//     final getBankAccountResponseModel = getBankAccountResponseModelFromJson(jsonString);

///============================================================================>
GetBankAccountResponseModel getBankAccountResponseModelFromJson(String str) =>
    GetBankAccountResponseModel.fromJson(json.decode(str));

String getBankAccountResponseModelToJson(GetBankAccountResponseModel data) =>
    json.encode(data.toJson());

class GetBankAccountResponseModel {
  int? status;
  String? message;
  BankData? data;

  GetBankAccountResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetBankAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      GetBankAccountResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : BankData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class BankData {
  String? id;
  Banks? bank;
  String? holderName;
  String? ifsc;
  String? accountNumber;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? user;

  BankData({
    this.id,
    this.bank,
    this.holderName,
    this.ifsc,
    this.accountNumber,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory BankData.fromJson(Map<String, dynamic> json) => BankData(
        id: json["id"],
        bank: json["bank"] == null ? null : Banks.fromJson(json["bank"]),
        holderName: json["holder_name"],
        ifsc: json["ifsc"],
        accountNumber: json["account_number"],
        isVerified: json["is_verified"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bank": bank,
        "holder_name": holderName,
        "ifsc": ifsc,
        "account_number": accountNumber,
        "is_verified": isVerified,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
        "user": user,
      };
}

///============================================================================>
