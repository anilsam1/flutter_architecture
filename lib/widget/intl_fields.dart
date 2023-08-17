import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_filed.dart';

class AppIntlField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validators;

  const AppIntlField({
    super.key,
    this.hintText,
    this.controller,
    this.validators,
  });

  @override
  State<AppIntlField> createState() => _AppIntlFieldState();
}

class _AppIntlFieldState extends State<AppIntlField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AppTextField(
          validators: widget.validators,
          controller: widget.controller,
          prefixIcon: SizedBox(
            width: 130.w,
            child: CountryCodePicker(
              onChanged: print,
              initialSelection: 'IT',
              favorite: ['+39', 'FR'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              showFlagMain: true,
              showFlag: true,
              flagWidth: 26.r,
              flagDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              builder: (country) => Row(
                children: [
                  19.horizontalSpace,
                  ClipRRect(
                    child: Image.asset(
                      'assets/flags/${country?.code?.toLowerCase()}.png',
                      package: 'intl_phone_field',
                      width: 26.r,
                      height: 26.r,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  8.horizontalSpace,
                  Text(country?.dialCode ?? ""),
                  20.horizontalSpace,
                  Container(
                    height: 53.h,
                    width: 1.w,
                    color: AppColor.fieldBorder,
                  )
                ],
              ),
            ),
          ),
          hint: widget.hintText,
        ),
      ],
    );
  }
}
