import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/screen/books/books_screen.dart';
import 'package:flutter_architecture/screen/edit_profile/edit_profile_screen.dart';
import 'package:flutter_architecture/screen/home/home_screen.dart';
import 'package:flutter_architecture/screen/login/login_screen.dart';
import 'package:flutter_architecture/screen/splash/splash_screen.dart';

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

var booksScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BooksScreen();
});
