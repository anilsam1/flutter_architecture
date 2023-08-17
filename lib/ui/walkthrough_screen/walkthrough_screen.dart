import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/walkthrough_screen/model/walkthrough_model.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class WalkthroughPage extends StatefulWidget {
  const WalkthroughPage({super.key});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  List<WalkthroughModel> walkthroughData = [
    WalkthroughModel(
        walkthroughImage: Assets.imageWalkthroughImage1,
        walkthroughDesc: S.current.walkthroughDescOne),
    WalkthroughModel(
        walkthroughImage: Assets.imageWalkthroughImage2,
        walkthroughDesc: S.current.walkthroughDescTwo),
    WalkthroughModel(
        walkthroughImage: Assets.imageWalkthroughImage3,
        walkthroughDesc: S.current.walkthroughDescThree)
  ];
  final pageController = PageController();
  late ValueNotifier<int> pageIndex;

  @override
  void initState() {
    locator<AppDB>().firstTime = false;
    pageIndex = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildPageView(),
          walkthroughContent(),
        ],
      ),
    );
  }

  Padding walkthroughContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        children: [
          46.verticalSpace,
          headerWidget(),
          Spacer(),
          SmoothPageIndicator(
              controller: pageController,
              // PageController
              count: 3,
              effect: ScaleEffect(
                  activeDotColor: AppColor.dotSelected,
                  dotHeight: 6.r,
                  dotWidth: 6.r,
                  dotColor: AppColor.dotNotSelected),
              // your preferred effect
              onDotClicked: (index) {}),
          61.verticalSpace,
          ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (context, value, child) {
              return AppButton(
                value == walkthroughData.length - 1
                    ? "Get Stated"
                    : S.current.next,
                () {
                  if (value < walkthroughData.length - 1) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  } else {
                    context.router.replace(WelcomeRoute());
                  }
                },
                radius: 26.r,
              );
            },
          ),
          80.verticalSpace
        ],
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemCount: walkthroughData.length,
      controller: pageController,
      onPageChanged: (value) {
        pageIndex.value = value;
      },
      itemBuilder: (context, index) {
        print("page ${pageIndex.value}");
        return Column(
          children: [
            193.verticalSpace,
            SvgPicture.asset(
              walkthroughData[index].walkthroughImage,
              width: 300.w,
              height: 284.h,
            ),
            50.verticalSpace,
            Text(
              walkthroughData[index].walkthroughDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.spMin,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.16,
              ),
              maxLines: 2,
            ),
          ],
        );
      },
    );
  }

  Row headerWidget() {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, value, child) {
            return IconButton(
              color: AppColor.black,
              onPressed: () {
                if (value > 0) {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                }
              },
              icon: Icon(Icons.keyboard_backspace),
            );
          },
        ),
        Spacer(),
        ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, value, child) {
            return value == walkthroughData.length - 1
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      if (value < walkthroughData.length) {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      }
                    },
                    child: Text(
                      S.current.skip,
                      style: textRegular,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
