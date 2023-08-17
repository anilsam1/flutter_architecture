import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final double? elevation;
  final double? height;
  final double? radius;
  final bool? welcome;
  final double? padding;
  final bool buttonColor;

  const AppButton(
    this.label,
    this.callback, {
    super.key,
    double this.elevation = 0.0,
    this.height,
    this.radius,
    this.padding,
    this.buttonColor = false,
    this.welcome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 53.h,
      decoration: ShapeDecoration(
        gradient: welcome ?? true
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFEFD9D5),
                  Color(0xFF75DCD8),
                  Color(0xFF73DDD9),
                  Color(0xFFE1D9D5),
                  Color(0xFFEFD9D5)
                ],
              )
            : LinearGradient(
                begin: Alignment(-0.19, 0.98),
                end: Alignment(0.19, -0.98),
                colors: [Color(0xFF73DDD9), Color(0xFFEFD9D5)],
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.50),
        ),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.50),
        ),
        elevation: elevation,
        padding: const EdgeInsets.only(top: 17.0, bottom: 17.0),
        onPressed: callback,
        color: buttonColor ? AppColor.grey : AppColor.transparent,
        child: Text(
          label,
          style: textRegular.copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
