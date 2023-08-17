import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/store/common_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LangPage extends StatefulWidget {
  const LangPage({super.key});

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  String? currentLang;
  ValueNotifier<int> _selectedValueIndex = ValueNotifier(0);
  List<String> lang = ["English", "Japanese"];

  @override
  void didChangeDependencies() {
    currentLang = Localizations.localeOf(context).toString().split('-')[0];
    _selectedValueIndex =
        currentLang == 'en' ? ValueNotifier(0) : ValueNotifier(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          60.verticalSpace,
          appBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: _selectedValueIndex,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.6.h),
                                child: Text(
                                  lang[index],
                                  style: textRegular.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              index == _selectedValueIndex.value
                                  ? customRadio()
                                  : GestureDetector(
                                      onTap: () {
                                        _selectedValueIndex.value = index;
                                        locator<CommonStore>().changeLocal(
                                            index == 1 ? 'ja' : 'en');
                                        context.router.replace(WelcomeRoute());
                                      },
                                      child: customUnselectedRadio())
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Divider(
                            thickness: 1,
                            color: Colors.black12,
                          ),
                        ),
                        5.verticalSpace
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container customUnselectedRadio() {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
        ),
      ),
    );
  }

  Container customRadio() {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.19, 0.98),
          end: Alignment(-0.19, -0.98),
          colors: [Color(0xFFEFD9D5), Color(0xFF73DDD9), Color(0xFFEFD9D5)],
        ),
        shape: OvalBorder(),
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 10.r,
      ),
    );
  }

  Row appBar() {
    return Row(
      children: [
        20.horizontalSpace,
        GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        92.horizontalSpace,
        Text(
          "Change Language",
          style: textRegular.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
