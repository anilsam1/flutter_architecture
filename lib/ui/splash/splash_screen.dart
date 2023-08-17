import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    futureFunction();
    super.initState();
  }

  void futureFunction() {
    Future.delayed(Duration(seconds: 3),() {
      print("first time......... ${locator<AppDB>().firstTime}");
      locator<AppDB>().firstTime ?  context.router.replace(WalkthroughRoute()) : context.router.replace(WelcomeRoute()) ;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: SvgPicture.asset(
              Assets.imageSplashBg,
            ),
          ),
          Center(child: SvgPicture.asset(Assets.imageWhoTryLogo))
        ],
      ),
    );
  }
}
