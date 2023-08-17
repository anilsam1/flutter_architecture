import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/header_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<PieChartSectionData> data = [
    PieChartSectionData(
      value: 10,
      color: AppColor.piePink,
    ),
    PieChartSectionData(
      value: 15,
      color: AppColor.pieYellow,
    ),
    PieChartSectionData(
      value: 30,
      color: AppColor.pieRed,
    ),
    PieChartSectionData(
      value: 25,
      color: AppColor.pieGreen,
    ),
    PieChartSectionData(
      value: 25,
      color: AppColor.pieBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.home_bg,
      appBar: PreferredSize(
          preferredSize: Size(0, 62.h),
          child: AppBarWidget(
            backgroundColor: AppColor.home_bg,
            paddingStart: 20,
            actionMenu: SvgPicture.asset(
              Assets.imageDotMenu,
              height: 21.h,
              width: 5.w,
            ),
            title: S.current.homeTitle,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            27.verticalSpace,
            _statementHeader(),
            16.verticalSpace,
            Divider(
              height: 1.h,
              color: AppColor.white,
            ),
            46.verticalSpace,
            pieChartBuild(),
            39.verticalSpace,
            pieIndicators(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 261.h,
                width: 1.sw,
                color: AppColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pieIndicators() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indicator(color: AppColor.pieBlue, title: S.current.pieFood),
                  8.verticalSpace,
                  indicator(
                      color: AppColor.piePink, title: S.current.pieTransport),
                  8.verticalSpace,
                  indicator(
                      color: AppColor.pieYellow, title: S.current.pieInvestment)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  indicator(color: AppColor.pieRed, title: S.current.pieRent),
                  8.verticalSpace,
                  indicator(
                      color: AppColor.pieGreen,
                      title: S.current.pieInstallment),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row indicator({required Color color, required String title}) {
    return Row(
      children: [
        Container(
          width: 14.w,
          height: 14.h,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4).r),
          ),
        ),
        16.horizontalSpace,
        Text(
          title,
          style: textRegular,
        )
      ],
    );
  }

  Widget pieChartBuild() {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
          color: Color(0XFF4E4880), borderRadius: BorderRadius.circular(120).r),
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 50.r,
          sections: data,
        ),
      ),
    );
  }

  Widget _statementHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(S.current.year, style: textRegular),
        Row(
          children: [
            Text(S.current.month, style: textHomeBold),
            Spacer(),
            Text(S.current.money, style: textHomeBold)
          ],
        )
      ],
    );
  }
}
