import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/rating/rating_model.dart';

import '../app_colors/app_colors.dart';
import '../home/home_model.dart';

class RatingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RatingController());
  }
}

class RatingController extends GetxController {
  static RatingController get to => Get.find();
  DashBoardItemModel acceptance = DashBoardItemModel(
      icon: Icon(
        Icons.check,
        color: AppColors.white,
      ),
      value: '98 %',
      text: 'Acceptance');
  DashBoardItemModel rating = DashBoardItemModel(
      icon: Icon(Icons.star, color: AppColors.white),
      value: '4.9',
      text: 'Rating');
  DashBoardItemModel cancellation = DashBoardItemModel(
      icon: Icon(Icons.close, color: AppColors.white),
      value: '2.0%',
      text: 'Cancellation');

  List<RatingItemsModel> ratingsList = <RatingItemsModel>[
    RatingItemsModel(
        date: DateTime.now(),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now(),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now(),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now(),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 1)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 1)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 1)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 1)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 1)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 5)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 5)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 5)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 5)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
    RatingItemsModel(
        date: DateTime.now().add(Duration(days: 5)),
        review:
            "Your service is very good. the experience that i had was incredible",
        starRating: 4),
  ];
}
