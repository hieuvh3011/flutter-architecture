import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoginError = false;

  @action
  Future<void> loginSuccess({Function onLoginSuccess}) async {
    isLoading = true;
    isLoginError = false;

    await Future.delayed(Duration(milliseconds: 1500));

    isLoading = false;

    if (onLoginSuccess != null) {
      onLoginSuccess();
    }
  }

  @action
  Future<void> loginError() async {
    isLoading = true;

    await Future.delayed(Duration(milliseconds: 1500));

    isLoading = false;
    isLoginError = true;
  }
}

/// Build (generate .g.dart) flutter packages pub run build_runner build
/// Watch (update .g.dart automatically) flutter packages pub run build_runner watch
/// Clean before updating: flutter packages pub run build_runner watch --delete-conflicting-outputs
///