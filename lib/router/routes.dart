import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/router/route_handlers.dart';

class Routes {
  static String root = '/';
  static String homeScreen = '/Home';
  static String splashScreenNew = '/Splash';

  /// PARAMS
  static String paramDisplayName = 'name';
  static String paramEmail = 'email';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print(
          '------> ROUTE WAS NOT FOUND !!! Go to routes.dart and route_handlers.dart and add your screen there <-------');
    });

    router.define(splashScreenNew, handler: splashScreenHandler);
    router.define(homeScreen, handler: homeScreenHandler);
  }
}
