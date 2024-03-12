// To parse this JSON data, do
//
//     final getEarningStatusResponseModel = getEarningStatusResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

GetEarningStatusResponseModel getEarningStatusResponseModelFromJson(
        String str) =>
    GetEarningStatusResponseModel.fromJson(json.decode(str));

String getEarningStatusResponseModelToJson(
        GetEarningStatusResponseModel data) =>
    json.encode(data.toJson());

class GetEarningStatusResponseModel {
  int? status;
  String? message;
  EarningData? data;

  GetEarningStatusResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetEarningStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetEarningStatusResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : EarningData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class EarningData {
  Earnings? earnings;
  PayoutSchedule? payoutSchedule;
  Rides? rides;

  EarningData({
    this.earnings,
    this.payoutSchedule,
    this.rides,
  });

  factory EarningData.fromJson(Map<String, dynamic> json) => EarningData(
        earnings: json["earnings"] == null
            ? null
            : Earnings.fromJson(json["earnings"]),
        payoutSchedule: json["payout_schedule"] == null
            ? null
            : PayoutSchedule.fromJson(json["payout_schedule"]),
        rides: json["rides"] == null ? null : Rides.fromJson(json["rides"]),
      );

  Map<String, dynamic> toJson() => {
        "earnings": earnings?.toJson(),
        "payout_schedule": payoutSchedule?.toJson(),
        "rides": rides?.toJson(),
      };
}

class Earnings {
  double? rideFare;
  double? waiverCharge;
  double? tax;
  double? incentives;
  double? referrals;
  double? total;
  List<EarningsByDay>? earningsByDay;

  Earnings({
    this.rideFare,
    this.waiverCharge,
    this.tax,
    this.incentives,
    this.referrals,
    this.total,
    this.earningsByDay,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) => Earnings(
        rideFare: json["ride_fare"].toDouble(),
        waiverCharge: json["waiver_charge"].toDouble(),
        tax: json["tax"].toDouble(),
        incentives: json["incentives"].toDouble(),
        referrals: json["referrals"].toDouble(),
        total: json["total"].toDouble(),
        earningsByDay: json["earnings_by_day"] == null
            ? []
            : List<EarningsByDay>.from(
                json["earnings_by_day"]!.map((x) => EarningsByDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ride_fare": rideFare,
        "waiver_charge": waiverCharge,
        "tax": tax,
        "incentives": incentives,
        "referrals": referrals,
        "total": total,
        "earnings_by_day": earningsByDay == null
            ? []
            : List<dynamic>.from(earningsByDay!.map((x) => x.toJson())),
      };
}

class EarningsByDay {
  DateTime? day;
  double? total;

  EarningsByDay({
    this.day,
    this.total,
  });

  factory EarningsByDay.fromJson(Map<String, dynamic> json) => EarningsByDay(
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "total": total,
      };
}

class PayoutSchedule {
  PayoutSchedule();

  factory PayoutSchedule.fromJson(Map<String, dynamic> json) =>
      PayoutSchedule();

  Map<String, dynamic> toJson() => {};
}

class Rides {
  double? totalRides;
  double? totalDistance;
  double? totalDuration;

  Rides({
    this.totalRides,
    this.totalDistance,
    this.totalDuration,
  });

  factory Rides.fromJson(Map<String, dynamic> json) => Rides(
        totalRides: json["total_rides"].toDouble(),
        totalDistance: json["total_distance"].toDouble(),
        totalDuration: json["total_duration"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "total_rides": totalRides,
        "total_distance": totalDistance,
        "total_duration": totalDuration,
      };
}

///============================================================================>

// To parse this JSON data, do
//
//     final getEarningListResponseModel = getEarningListResponseModelFromJson(jsonString);

GetEarningListResponseModel getEarningListResponseModelFromJson(String str) =>
    GetEarningListResponseModel.fromJson(json.decode(str));

String getEarningListResponseModelToJson(GetEarningListResponseModel data) =>
    json.encode(data.toJson());

class GetEarningListResponseModel {
  int? status;
  String? message;
  Data? data;

  GetEarningListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetEarningListResponseModel.fromJson(Map<String, dynamic> json) =>
      GetEarningListResponseModel(
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
  int? count;
  bool? next;
  bool? previous;
  List<EarningListItem>? results;

  Data({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<EarningListItem>.from(
                json["results"]!.map((x) => EarningListItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class EarningListItem {
  String? id;
  String? earningType;
  String? amount;
  bool? isPaid;
  DateTime? paidTime;
  DateTime? created;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? user;

  EarningListItem({
    this.id,
    this.earningType,
    this.amount,
    this.isPaid,
    this.paidTime,
    this.created,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory EarningListItem.fromJson(Map<String, dynamic> json) =>
      EarningListItem(
        id: json["id"],
        earningType: json["earning_type"],
        amount: json["amount"],
        isPaid: json["is_paid"],
        paidTime: json["paid_time"] == null
            ? null
            : DateTime.parse(json["paid_time"]),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
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
        "earning_type": earningType,
        "amount": amount,
        "is_paid": isPaid,
        "paid_time": paidTime?.toIso8601String(),
        "created": created?.toIso8601String(),
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
        "user": user,
      };
}

class EarningItemModel {
  Widget icon;
  RxDouble value;
  String text;
  EarningItemModel({
    required this.icon,
    required this.value,
    required this.text,
  });
}
