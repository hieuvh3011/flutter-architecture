import 'package:flutter/material.dart';
import 'package:flutter_architecture/event/event_manager.dart';
import 'package:flutter_architecture/event/timer_event.dart';
import 'package:flutter_architecture/localization/flutter_localizations.dart';
import 'package:flutter_architecture/localization/text_names.dart';
import 'package:flutter_architecture/router/routes.dart';
import 'package:flutter_architecture/store/login_store.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/dimens.dart';
import 'package:flutter_architecture/timer/timer.dart';
import 'package:flutter_architecture/utils/ui_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore _loginStore = LoginStore();

  @override
  void initState() {
    super.initState();

    /// Test event listener
    AppTimer timer = AppTimer();
    timer.startTimer(Duration(seconds: 1));
    EventManager.instance.on<TimerTickEvent>().listen((TimerTickEvent event) {
      print(event.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterLocalizations _localization = FlutterLocalizations.of(context);
    String testLoginSuccess =
        _localization.getString(context, TextName.loginSuccess);
    String testLoginError =
        _localization.getString(context, TextName.loginError);
    String msgLoginError =
        _localization.getString(context, TextName.msgLoginError);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLoading(),
            _buildErrorMessage(msgLoginError),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            RaisedButton(
              child: Text(testLoginSuccess),
              onPressed: _onLoginSuccessButtonPressed,
            ),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            RaisedButton(
              child: Text(testLoginError),
              onPressed: _onLoginErrorButtonPressed,
            )
          ],
        ),
      ),
    );
  }

  _buildLoading() {
    return Observer(
      builder: (_) {
        if (_loginStore.isLoading) {
          return CircularProgressIndicator();
        }

        return Container();
      },
    );
  }

  _buildErrorMessage(String msgLoginError) {
    return Observer(
      builder: (_) {
        if (_loginStore.isLoginError) {
          return Text(
            msgLoginError,
            style: TextStyle(color: AppColors.error),
          );
        }

        return Container();
      },
    );
  }

  _onLoginSuccessButtonPressed() {
    _loginStore.loginSuccess(onLoginSuccess: _onLoginSuccess);
  }

  _onLoginErrorButtonPressed() {
    _loginStore.loginError();
  }

  _onLoginSuccess() {
    navigateTo(context, Routes.homeScreen);
  }
}
