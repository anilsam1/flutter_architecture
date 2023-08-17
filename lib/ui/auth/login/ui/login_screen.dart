import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/big_header_widget.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_demo_structure/widget/connect_with_logos.dart';
import 'package:flutter_demo_structure/widget/intl_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> passShow = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BigHeaderWidget(
            height: 271.h,
            callback: () {
              context.router.pop();
            },
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 0.3.sh),
                Container(
                  width: 1.sw,
                  height: 0.7.sh,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.verticalSpace,
                          Text(
                            S.current.signIn,
                            style: textAppBarStyle,
                          ),
                          13.verticalSpace,
                          Text(
                            S.current.heyGoodToSeeYouAgain,
                            style: textRegular,
                          ),
                          37.verticalSpace,
                          AppIntlField(
                            hintText: S.current.mobileNumber,
                            validators: mobileValidator,
                          ),
                          30.verticalSpace,
                          ValueListenableBuilder<bool>(
                            valueListenable: passShow,
                            builder: (context, value, child) {
                              return AppTextField(
                                  validators: passwordValidator,
                                  hint: S.current.password,
                                  obscureText: value,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      passShow.value =
                                          !value; // Update the value using the setter
                                    },
                                    child: Image.asset(Assets.imageEye),
                                  ));
                            },
                          ),
                          27.verticalSpace,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              S.of(context).forgetPassword,
                              style: textRegular.copyWith(
                                  color: AppColor.forgotText),
                            ),
                          ),
                          37.verticalSpace,
                          AppButton(S.current.signIn, () {
                            if (_formKey.currentState!.validate()) {}
                          }, welcome: false),
                          45.verticalSpace,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              S.current.orConnectWith,
                              style: textRegular,
                            ),
                          ),
                          27.verticalSpace,
                          ConnectWithLogo(),
                          44.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: textRegular,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.router.push(SignUpRoute());
                                },
                                child: Text(
                                  S.current.signUp,
                                  style: textRegular.copyWith(
                                      color: AppColor.forgotText),
                                ),
                              )
                            ],
                          ),
                          20.verticalSpace
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
