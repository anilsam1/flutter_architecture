import 'package:auto_route/annotations.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/store/common_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ScreenOnePage extends StatefulWidget {
  const ScreenOnePage({super.key});

  @override
  State<ScreenOnePage> createState() => _ScreenOnePageState();
}

class _ScreenOnePageState extends State<ScreenOnePage> {
  var commonStore = locator<CommonStore>();
  TextEditingController textController = TextEditingController();
  String? locale;
  @override
  void initState() {
    getLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add text to List",
              style: textRegular,
            ),
            20.verticalSpace,
            AppTextField(
              height: 50.h,
              controller: textController,
              hint: "Enter Text",
            ),
            20.verticalSpace,

            30.verticalSpace,
            AppButton("Next Page", () {
              commonStore.addToList(textController.text);
              locator<AppRouter>().push(ScreenTwoRoute());
              textController.clear();
            })
          ],
        ),
      ),
    );
  }

  Future<String?> getLocal() async {
    locale = await Devicelocale.currentLocale;
    print("local...............................$locale");
    return locale;
  }
}
