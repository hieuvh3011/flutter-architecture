import 'package:flutter/material.dart';
import 'package:flutter_architecture/store/profile_store.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/dimens.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileStore _profileStore;

  @override
  Widget build(BuildContext context) {
    _profileStore = Provider.of<ProfileStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            // Use localization in real app please!!!
            'Edit Profile'),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                return Text(
                  'You have ${_profileStore.followerNumber} followers',
                  style: TextStyle(fontSize: Dimens.headerTextSize),
                );
              },
            ),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            Text(
              '(The number of follower here will be updated on Home screen also!!! The tech behind this is Provider + MobX store)',
              style: TextStyle(fontSize: Dimens.headerTextSize),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            RaisedButton(
              child: Text(
                  // Use localization in real app please!!!
                  'Increase Follower Number'),
              onPressed: _onIncreaseButtonPressed,
            ),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            RaisedButton(
              child: Text(
                  // Use localization in real app please!!!
                  'Decrease Follower Number'),
              onPressed: _onDecreaseButtonPressed,
            )
          ],
        ),
      ),
    );
  }

  _onIncreaseButtonPressed() {
    _profileStore.increaseFollowerNumber();
  }

  _onDecreaseButtonPressed() {
    _profileStore.decreaseFollowerNumber();
  }
}
