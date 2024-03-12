import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/app_extensions/app_extensions.dart';
import 'package:waiver_driver/constants/get_storage_constants.dart';
import 'package:waiver_driver/earning/earning_controller.dart';
import 'package:waiver_driver/empty_page/empty_page.dart';
import 'package:waiver_driver/error_page/error_page.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';

import '../assets/icons.dart';
import '../circle_with_gradient/circle_with_gradient.dart';
import 'earning_model.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Earnings"),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: 25.sp,
              ),
              TabBar(
                  unselectedLabelColor: AppColors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.white,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.blue),
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(color: AppColors.blue, width: 1.sp)),
                        child: Text("TODAY"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: AppColors.blue, width: 1.5.sp)),
                        child: Text("WEEKLY"),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 15.sp,
              ),
              Expanded(
                  child: TabBarView(children: [
                TodayTab(),
                WeeklyTab(),
              ]))
            ],
          ),
        ));
  }
}

class EarningGraph extends StatelessWidget {
  const EarningGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.sp,
      child: GetX<EarningController>(builder: (controller) {
        return controller.isGraphLoading.value
            ? LoadingBarsAnimation(
                height: 140.sp,
              )
            : controller.noDataForGraph.value
                ? EmptyPage(
                    text: "Data Earnings available",
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: controller.graphValues
                        .map((graphValue) => EarningGraphBar(
                              graphValue: graphValue,
                            ))
                        .toList(),
                  );
      }),
    );
  }
}

class EarningGraphBar extends StatelessWidget {
  EarningsByDay? graphValue;
  EarningGraphBar({super.key, required this.graphValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (EarningController.to.selectGraphValue.value == graphValue) {
          EarningController.to.selectGraphValue.value = null;
        } else {
          EarningController.to.selectGraphValue.value = graphValue;
        }
        EarningController.to.startAnimation(amount: graphValue?.total ?? 0.0);
      },
      child: GetX<EarningController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  color: controller.selectGraphValue.value == graphValue
                      ? AppColors.blue
                      : AppColors.grey155,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.sp),
                    topRight: Radius.circular(8.sp),
                  )),
              height:
                  (graphValue?.total ?? 0) * (110 / controller.maxValue.value),
              width: ((Get.width - 60.sp) / 8) - 5.sp,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(DateFormat("E").format(graphValue!.day!))
          ],
        );
      }),
    );
  }
}

class WeeklyTab extends StatelessWidget {
  const WeeklyTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EarningController());
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
      shrinkWrap: true,
      children: [
        EarningSummaryWeekly(),
        SizedBox(
          height: 15.sp,
        ),
        BalanceAmount(),
        SizedBox(
          height: 25.sp,
        ),
        EarningController.to.weeklyEarningList.isEmpty
            ? EmptyPage(
                text: "No Earning found",
              )
            : Column(
                children: EarningController.to.weeklyEarningList
                    .map((earning) => EarningListingItem(
                          earning: earning,
                        ))
                    .toList(),
              ),
        GetX<EarningController>(builder: (controller) {
          return controller.isTodayEarningsIsListCompleted.value
              ? LoadingBarsAnimation()
              : SizedBox();
        }),
      ],
    );
  }
}

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<EarningController>(builder: (controller) {
      return controller.isLoading.value
          ? LoadingBarsAnimation()
          : controller.isError.value
              ? ErrorPage()
              : ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
                  shrinkWrap: true,
                  children: [
                    EarningSummaryToday(),
                    SizedBox(
                      height: 15.sp,
                    ),
                    BalanceAmountToday(),
                    SizedBox(
                      height: 25.sp,
                    ),
                    EarningController.to.weeklyEarningList.isEmpty
                        ? EmptyPage(
                            text: "No Earning found",
                          )
                        : Column(
                            children: EarningController.to.todayEarningList
                                .map((earning) => EarningListingItem(
                                      earning: earning,
                                    ))
                                .toList(),
                          ),
                    GetX<EarningController>(builder: (controller) {
                      return controller.isTodayEarningsIsListCompleted.value
                          ? LoadingBarsAnimation()
                          : SizedBox();
                    }),
                  ],
                );
    });
  }
}

class EarningListingItem extends StatelessWidget {
  EarningListItem earning;

  EarningListingItem({required this.earning});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 15.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleWithIcon(
                height: 40.sp,
                color: AppColors.blue,
                child: Image.asset(
                  earning.earningType == EarningType.ride
                      ? AppIcons.car
                      : AppIcons.referAndEarn,
                  height: 20.sp,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    earning.earningType == EarningType.ride
                        ? "Trip Fare Added"
                        : "Referal Erning added",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  earning.paidTime != null
                      ? Text(
                          DateFormat("EEE dd MMM yyyy 'at' hh mm a")
                              .format(earning.paidTime!),
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.grey93),
                        )
                      : SizedBox()
                ],
              ),
            ],
          ),
          Text(
            "₹ +${earning.amount}",
            style: TextStyle(color: AppColors.green40),
          )
        ],
      ),
    );
  }
}

class BalanceAmountToday extends StatelessWidget {
  const BalanceAmountToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance Amount",
            style: TextStyle(fontSize: 14.sp, color: AppColors.grey93),
          ),
          Text(
            "₹ ${EarningController.to.todayBalanceAmount}",
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            "Payout scheduled: ${DateFormat("dd MMMM").format(EarningController.to.payOutDate)}",
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class BalanceAmount extends StatelessWidget {
  const BalanceAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance Amount",
            style: TextStyle(fontSize: 14.sp, color: AppColors.grey93),
          ),
          Text(
            "₹ ${EarningController.to.weeklyBalanceAmount}",
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            "Payout scheduled: ${DateFormat("dd MMMM").format(EarningController.to.payOutDate)}",
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PreviousWeek extends StatelessWidget {
  const PreviousWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => EarningController.to.getPreviousWeekData(),
        child: const Icon(Icons.arrow_back_ios));
  }
}

class NextWeek extends StatelessWidget {
  const NextWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => EarningController.to.getNextWeekData(),
        child: const Icon(Icons.arrow_forward_ios_rounded));
  }
}

class DateForGraphWeekly extends StatelessWidget {
  const DateForGraphWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetX<EarningController>(builder: (controller) {
          return controller.weeklyDateEnd.value.changeDateFormat() ==
                  DateTime.now()
                      .subtract(const Duration(days: 7 * 10))
                      .changeDateFormat()
              ? const SizedBox()
              : const PreviousWeek();
        }),
        GetX<EarningController>(builder: (controller) {
          return EarningController.to.selectGraphValue.value?.day == null
              ? Text(
                  "${EarningController.to.weeklyDateEnd.value.subtract(const Duration(days: 7)).changeDateFormat(format: "EEE dd MMM yyyy")} to ${EarningController.to.weeklyDateEnd.value.changeDateFormat(format: "EEE dd MMM yyyy")}",
                  style: TextStyle(color: AppColors.grey93, fontSize: 14.sp))
              : Text(
                  DateFormat("EEE dd MMM yyyy").format(
                      EarningController.to.selectGraphValue.value?.day ??
                          DateTime.now()),
                  style: TextStyle(color: AppColors.grey93, fontSize: 14.sp));
        }),
        GetX<EarningController>(builder: (controller) {
          return controller.weeklyDateEnd.value.changeDateFormat() ==
                  DateTime.now().changeDateFormat()
              ? const SizedBox()
              : const NextWeek();
        }),
      ],
    );
  }
}

class EarningSummaryWeekly extends StatelessWidget {
  bool? isWeekly;
  EarningSummaryWeekly({this.isWeekly});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          DateForGraphWeekly(),
          AnimatedBuilder(
              animation: EarningController.to.controller,
              builder: (BuildContext context, Widget? child) {
                return Text(
                    (EarningController.to.animation.value.roundToDouble())
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 22.sp));
              }),
          SizedBox(
            height: 25.sp,
          ),
          EarningGraph(),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EarningItem(item: EarningController.to.weeklyTrips),
              EarningItem(item: EarningController.to.weeklyOnlineHours),
              EarningItem(item: EarningController.to.weeklyDistance),
            ],
          ),
          GetX<EarningController>(builder: (controller) {
            return controller.isGraphLoading.value
                ? LoadingAnimationDots()
                : ExpansionTile(
                    shape: Border(),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Text(
                      "Details",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    children: [
                      DetailsItemView(
                        text: "Trip Fare",
                        value: "₹ ${EarningController.to.weeklyTripFare}",
                      ),
                      DetailsItemView(
                        text: "Waiver Charge",
                        value: "- ₹ ${EarningController.to.weeklyWaiverCharge}",
                      ),
                      DetailsItemView(
                        text: "Tax",
                        value: "- ₹ ${EarningController.to.weeklyWaiverCharge}",
                      ),
                      DetailsItemView(
                        text: "Incentives",
                        value: "- ₹ ${EarningController.to.weeklyIncentives}",
                      ),
                      DetailsItemView(
                        text: "Refer Earnings",
                        value: "₹ ${EarningController.to.weeklyReferEarnings}",
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ],
                  );
          }),
          Divider(
            height: 1.5.sp,
            color: AppColors.grey155,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              GetX<EarningController>(builder: (controller) {
                return Text(
                  "₹ ${EarningController.to.weeklyPayment.value}",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}

class EarningItem extends StatelessWidget {
  EarningItemModel item;
  EarningItem({
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .25,
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(width: 1.5.sp, color: AppColors.grey155)),
      child: Column(
        children: [
          CircleWithIcon(
              height: 30.sp, color: AppColors.blue, child: item.icon),
          SizedBox(
            height: 10.sp,
          ),
          GetX<EarningController>(builder: (controller) {
            return Text(
              item.value.toString(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            );
          }),
          Text(
            item.text,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey93),
          )
        ],
      ),
    );
  }
}

class EarningSummaryToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          Text(DateFormat("EEE dd MMM yyyy").format(DateTime.now()),
              style: TextStyle(color: AppColors.grey93, fontSize: 14.sp)),
          Text(
            "₹ ${EarningController.to.todayEarning}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
          ),
          SizedBox(
            height: 25.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EarningItem(item: EarningController.to.todayTrips),
              EarningItem(item: EarningController.to.todayOnlineHours),
              EarningItem(item: EarningController.to.todayDistance),
            ],
          ),
          ExpansionTile(
            shape: const Border(),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: const Text(
              "Details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            children: [
              DetailsItemView(
                text: "Trip Fare",
                value: "₹ ${EarningController.to.todayTripFare}",
              ),
              DetailsItemView(
                text: "Waiver Charge",
                value: "- ₹ ${EarningController.to.todayWaiverCharge}",
              ),
              DetailsItemView(
                text: "Tax",
                value: "- ₹ ${EarningController.to.todayWaiverCharge}",
              ),
              DetailsItemView(
                text: "Incentives",
                value: "- ₹ ${EarningController.to.todayIncentives}",
              ),
              DetailsItemView(
                text: "Refer Earnings",
                value: "₹ ${EarningController.to.todayReferEarnings}",
              ),
              SizedBox(
                height: 10.sp,
              ),
            ],
          ),
          Divider(
            height: 1.5.sp,
            color: AppColors.grey155,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "₹ ${EarningController.to.todayPayment}",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DetailsItemView extends StatelessWidget {
  String text;
  String value;
  DetailsItemView({required this.text, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class TodayOrWeekSelection extends StatelessWidget {
  const TodayOrWeekSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TodayOrWeekSelectionItem(
          header: "Today",
        ),
        TodayOrWeekSelectionItem(
          header: "Weekly",
        ),
      ],
    );
  }
}

class TodayOrWeekSelectionItem extends StatelessWidget {
  String header;
  TodayOrWeekSelectionItem({required this.header});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.blue),
      child: Text(
        header,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
    );
  }
}
