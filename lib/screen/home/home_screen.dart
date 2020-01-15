import 'package:flutter/material.dart';
import 'package:flutter_architecture/router/routes.dart';
import 'package:flutter_architecture/store/profile_store.dart';
import 'package:flutter_architecture/theme/colors.dart';
import 'package:flutter_architecture/theme/dimens.dart';
import 'package:flutter_architecture/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileStore _profileStore;

  @override
  Widget build(BuildContext context) {
    _profileStore = Provider.of<ProfileStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            // Use localization in real app please!!!
            'Home'),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // Use localization in real app please!!!
              'You have ${_profileStore.followerNumber} followers',
              style: TextStyle(fontSize: Dimens.headerTextSize),
            ),
            SizedBox(
              height: Dimens.screenPaddingVertical,
            ),
            RaisedButton(
              child: Text(
                  // Use localization in real app please!!!
                  'Edit Profile'),
              onPressed: _onEditProfileButtonPressed,
            ),
            RaisedButton(
              child: Text(
                  // Use localization in real app please!!!
                  'Get Books'),
              onPressed: _onGetBooksButtonPressed,
            )
          ],
        ),
      ),
    );
  }

  _onEditProfileButtonPressed() {
    navigateTo(context, Routes.editProfileScreen);
  }

  _onGetBooksButtonPressed() {
    navigateTo(context, Routes.booksScreen);
  }
}
