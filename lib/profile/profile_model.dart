// To parse this JSON data, do
//
//     final getProfileResponseModel = getProfileResponseModelFromJson(jsonString);

import 'dart:convert';

import '../registration/registration_model.dart';

GetProfileResponseModel getProfileResponseModelFromJson(String str) =>
    GetProfileResponseModel.fromJson(json.decode(str));

String getProfileResponseModelToJson(GetProfileResponseModel data) =>
    json.encode(data.toJson());

class GetProfileResponseModel {
  int? status;
  String? message;
  ProfileData? data;

  GetProfileResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProfileResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProfileData {
  String? id;
  StatesModel? state;
  DistrictModel? district;
  Transmission? transmissionType;
  VehicleType? vehicleType;
  WorkExperience? drivingExperience;
  WorkLocation? workLocation;
  String? uniqueId;
  String? fullname;
  String? gender;
  String? email;
  String? dob;
  bool? isVerified;
  String? alternativePhone;
  String? whatsappPhone;
  String? address;
  String? licenseValidity;
  String? profileImage;
  bool? isProfileImageVerified;
  String? createdAt;
  String? updatedAt;
  String? user;

  ProfileData({
    this.id,
    this.state,
    this.district,
    this.transmissionType,
    this.vehicleType,
    this.drivingExperience,
    this.workLocation,
    this.uniqueId,
    this.fullname,
    this.gender,
    this.email,
    this.dob,
    this.isVerified,
    this.alternativePhone,
    this.whatsappPhone,
    this.address,
    this.licenseValidity,
    this.profileImage,
    this.isProfileImageVerified,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        state:
            json["state"] == null ? null : StatesModel.fromJson(json["state"]),
        district: json["district"] == null
            ? null
            : DistrictModel.fromJson(json["district"]),
        transmissionType: json["transmission_type"] == null
            ? null
            : Transmission.fromJson(json["transmission_type"]),
        vehicleType: json["vehicle_type"] == null
            ? null
            : VehicleType.fromJson(json["vehicle_type"]),
        drivingExperience: json["driving_experience"] == null
            ? null
            : WorkExperience.fromJson(json["driving_experience"]),
        workLocation: json["work_location"] == null
            ? null
            : WorkLocation.fromJson(json["work_location"]),
        uniqueId: json["unique_id"],
        fullname: json["fullname"],
        gender: json["gender"],
        email: json["email"],
        dob: json["dob"],
        isVerified: json["is_verified"],
        alternativePhone: json["alternative_phone"],
        whatsappPhone: json["whatsapp_phone"],
        address: json["address"],
        licenseValidity: json["license_validity"],
        profileImage: json["profile_image"],
        isProfileImageVerified: json["is_profile_image_verified"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state": state?.toJson(),
        "district": district?.toJson(),
        "transmission_type": transmissionType?.toJson(),
        "vehicle_type": vehicleType?.toJson(),
        "driving_experience": drivingExperience?.toJson(),
        "work_location": workLocation?.toJson(),
        "unique_id": uniqueId,
        "fullname": fullname,
        "gender": gender,
        "email": email,
        "dob": dob,
        "is_verified": isVerified,
        "alternative_phone": alternativePhone,
        "whatsapp_phone": whatsappPhone,
        "address": address,
        "license_validity": licenseValidity,
        "profile_image": profileImage,
        "is_profile_image_verified": isProfileImageVerified,
        "created_at": "createdAt",
        "updated_at": updatedAt,
        "user": user,
      };
}

class District {
  int? id;
  String? name;
  int? state;

  District({
    this.id,
    this.name,
    this.state,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
      };
}

class DrivingExperience {
  int? id;
  int? experience;

  DrivingExperience({
    this.id,
    this.experience,
  });

  factory DrivingExperience.fromJson(Map<String, dynamic> json) =>
      DrivingExperience(
        id: json["id"],
        experience: json["experience"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experience": experience,
      };
}

class State {
  int? id;
  String? name;

  State({
    this.id,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) =>
    UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateProfileResponseModel {
  int? status;
  String? message;
  Data? data;

  UpdateProfileResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponseModel(
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
  String? email;
  String? alternativePhone;
  String? whatsappPhone;

  Data({
    this.email,
    this.alternativePhone,
    this.whatsappPhone,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        alternativePhone: json["alternative_phone"],
        whatsappPhone: json["whatsapp_phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "alternative_phone": alternativePhone,
        "whatsapp_phone": whatsappPhone,
      };
}
