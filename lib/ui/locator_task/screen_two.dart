import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/store/common_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ScreenTwoPage extends StatefulWidget {
  const ScreenTwoPage({super.key});

  @override
  State<ScreenTwoPage> createState() => _ScreenTwoPageState();
}

class _ScreenTwoPageState extends State<ScreenTwoPage> {
  var commonStore = locator<CommonStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            locator<AppRouter>().pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined ,size: 20.r),
        ),
      ),
      body: Expanded(
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: commonStore.observableList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    commonStore.observableList[index],
                    style: TextStyle(fontSize: 25),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
