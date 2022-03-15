import 'package:flutter/material.dart';
import 'package:inovatask/presentation/pages/LoginPage/loginpage.dart';
import 'package:inovatask/presentation/pages/MainPage/mainpage.dart';

import 'strings_manager.dart';

class Routes {
  static const String mainPage = "/";
  static const String loginPage = "login-page";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
