import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/auth/login/widget/login_form.dart';
import 'package:flutter_demo_structure/ui/auth/login/widget/sign_up_form.dart';
import 'package:flutter_demo_structure/ui/auth/login/widget/socal_buttons.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  final logInKey = GlobalKey<FormState>();
  final signInKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _animationTextRotation;
  bool _isShowSignUp = false;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRotation =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    print(_isShowSignUp);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              AnimatedPositioned(
                left: _isShowSignUp ? -0.76.sw : 0,
                width: 0.88.sw,
                height: 1.sh,
                duration: defaultDuration,
                child: Container(
                  color: AppColor.login_bg,
                  child: LoginForm(
                    formKey: logInKey,
                  ),
                ),
              ),
              AnimatedPositioned(
                  left: _isShowSignUp ? 0.12.sw : 0.88.sw,
                  width: 0.88.sw,
                  height: 1.sh,
                  duration: defaultDuration,
                  child: Container(
                    color: AppColor.signup_bg,
                    child: SignUpForm(
                      formKey: signInKey,
                    ),
                  )),
              AnimatedPositioned(
                  top: 0.1.sh,
                  left: 0,
                  right: _isShowSignUp ? -0.06.sw : 0.06.sw,
                  duration: defaultDuration,
                  child: CircleAvatar(
                    backgroundColor: Colors.white60,
                    radius: 25.r,
                    child: SvgPicture.asset(Assets.imageAnimationLogo),
                  )),
              AnimatedPositioned(
                  bottom: 0.1.sh,
                  left: 0,
                  right: _isShowSignUp ? -0.06.sw : 0.06.sw,
                  duration: defaultDuration,
                  child: const SocalButtns()),
              AnimatedPositioned(
                  bottom: _isShowSignUp ? 0.5.sh : 0.3.sh,
                  left: _isShowSignUp ? 0 : 0.44.sw - 60,
                  duration: defaultDuration,
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        fontSize: _isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                    textAlign: TextAlign.center,
                    duration: defaultDuration,
                    child: Transform.rotate(
                      alignment: Alignment.topLeft,
                      angle: -_animationTextRotation.value * pi / 180,
                      child: InkWell(
                        onTap: _isShowSignUp ? updateView : logInValidation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Log in".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  )),
              AnimatedPositioned(
                  bottom: !_isShowSignUp ? 0.5.sh : 0.3.sh,
                  left: !_isShowSignUp ? 0.76.sw : 0.44.sw - 30,
                  duration: defaultDuration,
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        fontSize: !_isShowSignUp ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                    textAlign: TextAlign.center,
                    duration: defaultDuration,
                    child: Transform.rotate(
                      alignment: Alignment.topRight,
                      angle: (90 - _animationTextRotation.value) * pi / 180,
                      child: InkWell(
                        onTap: _isShowSignUp ? signUpValidation : updateView,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "sign up".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  void logInValidation() {
    if (logInKey.currentState!.validate()) {
      context.router.replace(HomeRoute());
      print("is show sign up.....$_isShowSignUp");
    }
  }

  void signUpValidation() {
    if (signInKey.currentState!.validate()) {
      updateView();
      print("is show sign up.....$_isShowSignUp");
    }
  }
}
