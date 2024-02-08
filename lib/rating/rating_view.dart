import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/home/home_view.dart';
import 'package:waiver_driver/rating/rating_controller.dart';
import 'package:waiver_driver/rating/rating_model.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Rating"),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Column(
                children: RatingController.to.ratingsList
                    .map((rating) => RatingContainer(rating: rating))
                    .toList(),
              )
            ]));
  }
}

class RatingContainer extends StatelessWidget {
  RatingItemsModel rating;
  RatingContainer({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 14.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: (Column(
        children: [
          StarBuilder(
            count: rating.starRating,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            rating.review,
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
