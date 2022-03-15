import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovatask/shared/resources/routes_manager.dart';
import 'package:inovatask/shared/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor

  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.loginPage,
        theme: getApplicationTheme(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
