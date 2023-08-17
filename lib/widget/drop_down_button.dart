import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown extends StatefulWidget {
  final List<String>? items;
  final String hint;
  final String? error;
  final FormFieldValidator<String>? validators;
  const AppDropDown({super.key, this.items, required this.hint, this.validators,  this.error});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: textRegular,
      validator: widget.validators,
      icon: Padding(
        padding:EdgeInsets.only(right: 16).r,
        child: const Icon(Icons.keyboard_arrow_down_rounded),
      ),
      iconSize: 25,
      iconDisabledColor: AppColor.grey,
      iconEnabledColor: AppColor.grey,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: textField,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17).r,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6).r,
          borderSide: const BorderSide(
            color: AppColor.fieldBorder,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6).r,
          borderSide: const BorderSide(
            color: AppColor.fieldBorder,
            width: 1,
          ),
        ),
        errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(6).r,
          borderSide: const BorderSide(
            color: AppColor.fieldBorder,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6).r,
          borderSide: const BorderSide(
            color: AppColor.fieldBorder,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6).r,
          borderSide: const BorderSide(
            color: AppColor.fieldBorder,
            width: 1,
          ),
        ),
        errorStyle: textRegular.copyWith(color: AppColor.red)
      ),
      dropdownColor: Colors.white,
      onChanged: (String? newValue) {
      },
      items: widget.items?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
