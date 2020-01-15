import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/localization/flutter_localizations_delegate.dart';
import 'package:flutter_architecture/router/routes.dart';
import 'package:flutter_architecture/screen/splash/splash_screen.dart';
import 'package:flutter_architecture/store/app_store.dart';
import 'package:flutter_architecture/store/profile_store.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  static Router router;

  App({Key key}) : super(key: key) {
    final router = new Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Provider is kind of injection in Flutter.
      /// We need to declare any class we want to inject in the app later here.
      providers: [
        Provider<AppStore>(
          create: (_) => AppStore(),
        ),
        Provider<ProfileStore>(
          create: (_) => ProfileStore(),
        )
      ],
      child: MaterialApp(
          color: AppColors.primary,
          debugShowCheckedModeBanner: false,
          title: '',
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('vi', 'VN')
          ],
          localizationsDelegates: [
            FlutterLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            if (locale == null) {
              debugPrint("*language locale is null!!!");
              return supportedLocales.first;
            }

            for (Locale supportedLocale in supportedLocales) {
              if (locale != null) {
                if (supportedLocale.languageCode == locale.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
            }
            return supportedLocales.first;
          },
          onGenerateRoute: App.router.generator,
          theme: ThemeData(
              primaryColor: AppColors.primary,
              accentColor: AppColors.primary,
              fontFamily: Fonts.Lato,
              primaryTextTheme: TextTheme(
                title:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              primaryIconTheme: IconThemeData(color: Colors.white)),
          home: SplashScreen()),
    );
  }
}
