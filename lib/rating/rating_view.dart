import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/empty_page/empty_page.dart';
import 'package:waiver_driver/error_page/error_page.dart';
import 'package:waiver_driver/home/home_view.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';
import 'package:waiver_driver/rating/rating_controller.dart';
import 'package:waiver_driver/rating/rating_model.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Rating"),
        body: GetX<RatingController>(builder: (controller) {
          return controller.isLoading.value
              ? const LoadingBarsAnimation()
              : controller.isError.value
                  ? const ErrorPage()
                  : controller.ratingsList.isEmpty
                      ? EmptyPage(
                          text: "No Rating Found",
                        )
                      : ListView(
                          controller: RatingController.to.scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          children: [
                              SizedBox(
                                height: 30.sp,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DashBoardItem(
                                      item: RatingController.to.acceptance,
                                    ),
                                    DashBoardItem(
                                      item: RatingController.to.rating,
                                    ),
                                    DashBoardItem(
                                      item: RatingController.to.cancellation,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              const Text(
                                "Ratings",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              GetX<RatingController>(builder: (controller) {
                                return Column(
                                  children: RatingController.to.ratingsList
                                      .map((rating) =>
                                          RatingContainer(review: rating))
                                      .toList(),
                                );
                              }),
                              GetX<RatingController>(builder: (controller) {
                                return controller.isListCompeted.value
                                    ? LoadingBarsAnimation(
                                        height: 200.sp,
                                      )
                                    : const SizedBox();
                              })
                            ]);
        }));
  }
}

class RatingContainer extends StatelessWidget {
  ReviewModel review;
  RatingContainer({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 14.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StarBuilder(
            count: review.rating ?? 0,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            review.review ?? "",
            style: TextStyle(color: AppColors.grey93, fontSize: 12.sp),
          )
        ],
      )),
    );
  }
}

class StarBuilder extends StatelessWidget {
  int count;
  StarBuilder({required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 2.sp),
                child: Image.asset(
                  AppIcons.star,
                  color: index < count ? AppColors.golden : AppColors.grey155,
                  height: 15.sp,
                ),
              )),
    );
  }
}
