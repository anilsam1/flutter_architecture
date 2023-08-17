import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey formKey;

  const SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Spacer(),
            AppTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validators: nameValidator,
                decoration: InputDecoration(
                    hintText: S.current.email,
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))))),
            15.verticalSpace,
            AppTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validators: passwordValidator,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    hintText: S.current.password,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))))),
            15.verticalSpace,
            AppTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validators: passwordValidator,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    hintText: S.current.confPassword,
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.4))))),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
