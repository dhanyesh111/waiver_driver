import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
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
  void onInit() async {
    super.onInit();

    try {
      isLoading.value = true;
      await Future.wait([getReviews(), getReviewsStatus()]);
      isError.value = false;
    } catch (error) {
      isError.value = false;
    } finally {
      isLoading.value = false;
    }

    scrollController.addListener(() {
      if (isListCompeted.value &&
          scrollController.position.maxScrollExtent ==
              scrollController.position.pixels) {
        getReviews();
      }
    });
  }

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isListCompeted = false.obs;
  ScrollController scrollController = ScrollController();
  Future<void> getReviews() async {
    var response = await ApiServices.getReviews();
    ratingsList.addAll(response.data?.results ?? []);
    isListCompeted.value = response.data?.next ?? false;
  }

  Future<void> getReviewsStatus() async {
    GetReviewStatusResponseModel response =
        await ApiServices.getReviewsStatus();
    acceptance.value = "${response.data?.acceptance ?? 0.0} %";
    rating.value = "${response.data?.rating ?? 0.0} ";
    cancellation.value = "${response.data?.cancellation ?? 0.0} %";
  }

  static RatingController get to => Get.find();
  DashBoardItemModel acceptance = DashBoardItemModel(
      icon: Icon(
        Icons.check,
        color: AppColors.white,
      ),
      value: '11',
      text: 'Acceptance');
  DashBoardItemModel rating = DashBoardItemModel(
      icon: Icon(Icons.star, color: AppColors.white),
      value: '11',
      text: 'Rating');
  DashBoardItemModel cancellation = DashBoardItemModel(
      icon: Icon(Icons.close, color: AppColors.white),
      value: '11',
      text: 'Cancellation');

  RxList<ReviewModel> ratingsList = <ReviewModel>[].obs;
}
