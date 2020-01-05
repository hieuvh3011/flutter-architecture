import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/store/app_store.dart';
import 'package:provider/provider.dart';

class FlutterLocalizations {
  final Locale locale;
  Map<String, dynamic> _enSentences;
  Map<String, dynamic> _viSentences;
  final bool isTest;

  FlutterLocalizations(this.locale, {this.isTest = false});

  static FlutterLocalizations of(BuildContext context) {
    return Localizations.of<FlutterLocalizations>(
        context, FlutterLocalizations);
  }

  Future<FlutterLocalizations> loadTest(Locale locale) async {
    return FlutterLocalizations(locale);
  }

  /// Load json files and decode them
  Future<FlutterLocalizations> load() async {
    String enData = await rootBundle.loadString('lib/res/strings/en.json');
    String viData = await rootBundle.loadString('lib/res/strings/vi.json');
    this._enSentences = json.decode(enData);
    this._viSentences = json.decode(viData);
    return FlutterLocalizations(locale);
  }

  /// Get a localized string using key.
  String getString(BuildContext context, String key) {
    if (isTest) {
      return key;
    }

    if (key == null || key.isEmpty) {
      return '...';
    }

    final appStore = Provider.of<AppStore>(context);
    if (appStore.isEnglish) {
      return this._enSentences[key];
    } else {
      return this._viSentences[key];
    }
  }

  /// Get list of localized strings using key
  List<dynamic> getList(BuildContext context, String key) {
    if (isTest) {
      return [key];
    }

    if (key == null || key.isEmpty) {
      return ['...'];
    }

    final appStore = Provider.of<AppStore>(context);
    if (appStore.isEnglish) {
      return this._enSentences[key];
    } else {
      return this._viSentences[key];
    }
  }
}
