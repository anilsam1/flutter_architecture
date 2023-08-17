import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/big_header_widget.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_demo_structure/widget/drop_down_button.dart';
import 'package:flutter_demo_structure/widget/intl_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ValueNotifier<bool> passShow = ValueNotifier(false);
  final ValueNotifier<File?> _selectedImage = ValueNotifier(null);
  ValueNotifier<bool> confirmPassShow = ValueNotifier(false);
  late FocusNode ageFocusNode;
  bool isChecked = true;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isCheckTerm = ValueNotifier(true);
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    ageFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    passController.clear();
    confirmPassController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BigHeaderWidget(
          height: 248.h,
          logoVisible: false,
          callback: () {
            context.router.pop();
          },
        ),
        Column(
          children: [
            95.verticalSpace,
            Expanded(
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.verticalSpace,
                          Text(
                            S.current.signUp,
                            style: textAppBarStyle,
                          ),
                          13.verticalSpace,
                          Text(
                            S.current.createAccount,
                            style: textRegular,
                          ),
                          24.verticalSpace,
                          Align(
                              alignment: Alignment.center, child: pickImage()),
                          49.verticalSpace,
                          AppTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validators: nameValidator,
                            height: 54.h,
                            hint: S.current.firstName,
                          ),
                          30.verticalSpace,
                          AppTextField(
                            height: 45.h,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validators: nameValidator,
                            hint: S.current.lastName,
                          ),
                          30.verticalSpace,
                          AppTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validators: emailValidator,
                            hint: S.current.emailIdOptional,
                          ),
                          30.verticalSpace,
                          AppIntlField(
                            hintText: S.current.mobileNumber,
                            validators: mobileValidator,
                          ),
                          30.verticalSpace,
                          AppDropDown(
                            validators: dropDownValidator,
                            items: [
                              S.current.london,
                              S.current.australia,
                              S.current.india
                            ],
                            hint: S.current.country,
                          ),
                          30.verticalSpace,
                          AppDropDown(
                              validators: dropDownValidator,
                              hint: S.current.city,
                              items: [
                                S.current.limbdi,
                                S.current.dholakpur,
                                S.current.tokyo
                              ]),
                          30.verticalSpace,
                          AppDropDown(
                              validators: dropDownValidator,
                              hint: S.current.age,
                              items: [
                                S.current.age0to10,
                                S.current.age10to20,
                                S.current.age20to30
                              ]),
                          30.verticalSpace,
                          AppDropDown(
                            validators: dropDownValidator,
                            hint: S.current.gender,
                            items: [S.current.male, S.current.female],
                          ),
                          30.verticalSpace,
                          ValueListenableBuilder(
                            valueListenable: passShow,
                            builder: (context, value, child) {
                              return AppTextField(
                                controller: passController,
                                obscureText: !value,
                                validators: passwordValidator,
                                hint: S.current.password,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    passShow.value = !value;
                                  },
                                  child: Image.asset(
                                    Assets.imageEye,
                                  ),
                                ),
                              );
                            },
                          ),
                          30.verticalSpace,
                          ValueListenableBuilder(
                            valueListenable: confirmPassShow,
                            builder: (context, value, child) {
                              return AppTextField(
                                controller: confirmPassController,
                                obscureText: !value,
                                validators: passwordValidator,
                                hint: S.current.confPassword,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      confirmPassShow.value = !value;
                                    },
                                    child: Image.asset(Assets.imageEye)),
                              );
                            },
                          ),
                          30.verticalSpace,
                          termAndCondition(context),
                          40.verticalSpace,
                          AppButton(
                            S.current.signUp,
                            () {
                              if (_formKey.currentState!.validate()) {
                                if (passController.text ==
                                    confirmPassController.text) {
                                  if (isCheckTerm.value) {
                                    context.router.replace(LoginRoute());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(S.of(context).checkTC)),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(S.of(context).notMatch),
                                  ));
                                }
                              }
                            },
                            welcome: false,
                          ),
                          30.verticalSpace
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget termAndCondition(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: isCheckTerm,
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                isCheckTerm.value = !value;
              },
              child: Container(
                  height: 22.r,
                  width: 22.r,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(1.00, -0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFF73DDD9), Color(0xFFEFD9D5)],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.all(3).r,
                  child: value
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17.r,
                        )
                      : null),
            );
          },
        ),
        11.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: S.current.iAgreeWithThe,
                  style: textField,
                  children: <InlineSpan>[
                    TextSpan(text: " "),
                    TextSpan(
                      text: S.current.termsConditions,
                      style: textRegular.copyWith(fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.current.iAgreeWithThe)),
                          );
                        },
                    ),
                    TextSpan(text: " "),
                    TextSpan(text: S.current.and, style: textField),
                  ],
                ),
              ),
              12.verticalSpace,
              Text(
                S.current.privacyPolicy,
                style: textRegular.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stack pickImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ValueListenableBuilder(
          valueListenable: _selectedImage,
          builder: (context, value, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(100).r,
              child: Container(
                height: 94.r,
                width: 94.r,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100).r),
                child: value != null
                    ? Image.file(
                        value,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        Assets.imageUser,
                        fit: BoxFit.cover,
                      ),
              ),
            );
          },
        ),
        Positioned(
            bottom: -12.h,
            child: GestureDetector(
                onTap: () {
                  getImage();
                },
                child: cameraButton()))
      ],
    );
  }

  Container cameraButton() {
    return Container(
      width: 34.r,
      height: 34.r,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Icon(
          Icons.camera_alt,
          color: Colors.black,
          size: 16.r,
        ),
      ),
    );
  }

  String? dropDownValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return S.of(context).pleaseSelectAnOption;
    }
    return null; // No validation error
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    _selectedImage.value = imageTemporary;
  }
}
