import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigHeaderWidget extends StatelessWidget {
  final double? height;
  final bool? logoVisible;
  final VoidCallback callback;



  const BigHeaderWidget(
      {super.key,
      this.height,
      this.logoVisible,
      required this.callback,
   });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 1.sw,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.19, 0.98),
          end: Alignment(0.19, -0.98),
          colors: [
            Color(0xFFEFD9D5),
            Color(0xFF73DDD9),
            Color(0xFF73DDD9),
            Color(0xFF73DDD9),
            Color(0xFFEFD9D5)
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          63.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
                onTap: callback,
                child: SvgPicture.asset(Assets.imageBackArrow)),
          ),
          logoVisible ?? true
              ? Column(
                  children: [
                    23.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        Assets.imageWhoTryLogo,
                        width: 60.w,
                        height: 62.h,
                      ),
                    ),
                    11.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Who Try".toUpperCase(),
                        style: textLogo,
                      ),
                    )
                  ],
                )
              : 1.verticalSpace,
        ],
      ),
    );
  }
}
