import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/screen/demo_mobx/edit_profile/edit_profile_screen.dart';
import 'package:flutter_architecture/screen/demo_mobx/home/home_screen.dart';
import 'package:flutter_architecture/screen/demo_mobx/login/login_screen.dart';
import 'package:flutter_architecture/screen/demo_mobx/splash/splash_screen.dart';

var splashScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //String userId = params[Constants.PARAM_USER_ID].first;
  return SplashScreen();
});

var homeScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

var loginScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginScreen();
});

var editProfileScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EditProfileScreen();
});
