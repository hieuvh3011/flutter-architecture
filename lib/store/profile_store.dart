import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  int followerNumber = 0;

  @action
  increaseFollowerNumber() {
    followerNumber++;
  }

  @action
  decreaseFollowerNumber() {
    followerNumber--;
  }
}

/// Build (generate .g.dart) flutter packages pub run build_runner build
/// Watch (update .g.dart automatically) flutter packages pub run build_runner watch
/// Clean before updating: flutter packages pub run build_runner watch --delete-conflicting-outputs
///