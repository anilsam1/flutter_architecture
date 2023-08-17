import 'dart:async';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/store/common_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/theme.dart';
import 'package:flutter_demo_structure/widget/custom_error_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupLocator();
      await locator.isReady<AppDB>();
      String? rewLocale = await Devicelocale.currentLocale;
      String? locale = rewLocale?.split('-')[0];

      /// Disable debugPrint logs in production
      if (kReleaseMode) {
        debugPrint = (String? message, {int? wrapWidth}) {};
      }

      // initialize firebase app
      //await Firebase.initializeApp();
      // set error builder widget
      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        return CustomErrorWidget(errorDetails: errorDetails);
      };

      // Fixing App Orientation.
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then(
        (value) => runApp(MyApp(
          appRouter: locator<AppRouter>(),
          appLocale: locale,
        )),
      );
    },
    (error, stack) => (Object error, StackTrace stackTrace) {
      if (!kReleaseMode) {
        debugPrint('[Error]: $error');
        debugPrint('[Stacktrace]: $stackTrace');
      }
    },
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  final String? appLocale;

  const MyApp({required this.appRouter, super.key, required this.appLocale});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => Observer(
        builder: (context) {
          print("observer........");
          return MaterialApp.router(
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            builder: (BuildContext context, Widget? widget) {
              return widget!;
            },
            routerDelegate: widget.appRouter.delegate(),
            routeInformationParser: widget.appRouter.defaultRouteParser(),
            onGenerateTitle: (context) => S.of(context).applicationTitle,
            locale: Locale(locator<CommonStore>().currentLocal),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        }
      ),
    );
  }
}
