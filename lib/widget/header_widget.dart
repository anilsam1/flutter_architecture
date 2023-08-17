import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatefulWidget {
  final Widget? actionMenu;
  final double paddingStart;
  final Color backgroundColor;
  final String title;

  const AppBarWidget({
    this.actionMenu,
    this.paddingStart = 10.0,
    this.backgroundColor = AppColor.white,
    super.key,
    required this.title,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

double paddingTop = kToolbarHeight - 20;

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: EdgeInsets.only(top: paddingTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: SvgPicture.asset(
                  Assets.imageBackArrow,
                  height: 11.h,
                  width: 24.w,
                )),
          ),
          Text(widget.title ,style: textAppBarStyle,),
          Padding(
            padding: const EdgeInsets.only(right: 34),
            child: widget.actionMenu ?? Container(),
          )
        ],
      ),
    );
  }
}
