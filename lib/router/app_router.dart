import 'package:auto_route/auto_route.dart';
import 'package:flutter_demo_structure/ui/auth/login/ui/auth_screen.dart';
import 'package:flutter_demo_structure/ui/auth/login/ui/login_screen.dart';
import 'package:flutter_demo_structure/ui/auth/sign_up/ui/sign_up_page.dart';
import 'package:flutter_demo_structure/ui/auth/welcome/walcome_page.dart';
import 'package:flutter_demo_structure/ui/home/ui/home_page.dart';
import 'package:flutter_demo_structure/ui/json_parse_task/sample_screen.dart';
import 'package:flutter_demo_structure/ui/lang_screen/ui/lang_page.dart';
import 'package:flutter_demo_structure/ui/locator_task/screen_one.dart';
import 'package:flutter_demo_structure/ui/locator_task/screen_two.dart';
import 'package:flutter_demo_structure/ui/splash/splash_screen.dart';
import 'package:flutter_demo_structure/ui/walkthrough_screen/walkthrough_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: WalkthroughRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: ScreenOneRoute.page),
    AutoRoute(page: ScreenTwoRoute.page),
    AutoRoute(page: LangRoute.page),
    AutoRoute(page: SampleRoute.page ,initial: true)
  ];
}
