import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConnectWithLogo extends StatelessWidget {
  const ConnectWithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imageIphone),
        17.horizontalSpace,
        SvgPicture.asset(Assets.imageGoogle),
        17.horizontalSpace,
        SvgPicture.asset(Assets.imageFacebook),
      ],
    );
  }
}
