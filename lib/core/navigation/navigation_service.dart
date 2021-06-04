import 'package:flutter/material.dart';

import '../locator.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> push(route) {
    return navigatorKey.currentState!.push(route);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {bool navigatorRoute = false}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => navigatorRoute);
  }

  Future<dynamic> pushOrReplacementNamed(String routeName, {dynamic arguments}) {
    var currentPage = "";
    try {
      currentPage = ModalRoute.of(navigatorKey.currentContext!)!.settings.name!;
      print("----------Current Page: $currentPage");
    } catch (error) {
      print(error);
    }

    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, ModalRoute.withName("landing"), arguments: arguments);
  }

  void pop<T>({T? result}) {
    return navigatorKey.currentState!.pop(result);
  }

  goBack<T>({T? result}) {
    return navigatorKey.currentState!.pop(result);
  }
}

final navigator = locator<NavigationService>();
