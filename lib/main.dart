import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(App());
  });
}