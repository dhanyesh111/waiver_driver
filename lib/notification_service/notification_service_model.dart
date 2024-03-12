// To parse this JSON data, do
//
//     final notificationDataModel = notificationDataModelFromJson(jsonString);

import 'dart:convert';

NotificationDataModel notificationDataModelFromJson(String str) =>
    NotificationDataModel.fromJson(json.decode(str));

String notificationDataModelToJson(NotificationDataModel data) =>
    json.encode(data.toJson());

class NotificationDataModel {
  String? isSalesman;
  String? type;
  String? customerOrderActivityApprovalId;
  String? customerOrderDetailsActivityId;
  String? customerOrderDetailsId;
  String? productName;
  String? storeName;
  String? orderId;

  NotificationDataModel({
    this.isSalesman,
    this.type,
    this.customerOrderActivityApprovalId,
    this.customerOrderDetailsActivityId,
    this.customerOrderDetailsId,
    this.productName,
    this.storeName,
    this.orderId,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        isSalesman: json["IsSalesman"],
        type: json["Type"],
        customerOrderActivityApprovalId:
            json["CustomerOrderActivityApprovalID"],
        customerOrderDetailsActivityId: json["CustomerOrderDetailsActivityID"],
        customerOrderDetailsId: json["customerOrderDetailsID"],
        productName: json["productName"],
        storeName: json["storeName"],
        orderId: json["orderID"],
      );

  Map<String, dynamic> toJson() => {
        "IsSalesman": isSalesman,
        "Type": type,
        "CustomerOrderActivityApprovalID": customerOrderActivityApprovalId,
        "CustomerOrderDetailsActivityID": customerOrderDetailsActivityId,
        "customerOrderDetailsID": customerOrderDetailsId,
        "productName": productName,
        "storeName": storeName,
        "orderID": orderId,
      };
}
