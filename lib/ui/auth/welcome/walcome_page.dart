
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/big_header_widget.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_demo_structure/widget/connect_with_logos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';


@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});


  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        locator<AppRouter>().replace(LangRoute());
      },
        child: Icon(Icons.language, color: Colors.white,),
      ),
      body: Column(
        children: [
          BigHeaderWidget(
            height: 248.h,
            callback: () {}
          ),
          34.verticalSpace,
          Text(
            S.current.welcome,
            style: textLarge,
          ),
          33.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.5.w),
            child: AppButton(S.current.signIn, () {
              context.router.push(LoginRoute());
            }, welcome: false),
          ),
          25.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.5.w),
            child: AppButton(
              S.current.signUp,
              () {
                context.router.push(SignUpRoute());
              },
              welcome: false,
            ),
          ),
          47.verticalSpace,
          Text(
            S.current.orConnectWith,
            style: textRegular,
          ),
          24.verticalSpace,
          ConnectWithLogo(),
          Spacer(),
          Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                Assets.imageWelcomeBg,
                width: 1.sw,
                height: 227.h,
              )),
        ],
      ),
    );
  }

  Future<bool?> askPermission() async{
    PermissionStatus status = await Permission.contacts.request();
    if(status.isDenied == true)
    {
      askPermission();
    }
    else
    {
      return true;
    }
    return null;
  }


}
