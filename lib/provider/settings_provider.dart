import 'dart:convert';

import 'package:api_news/apps/configs/const_app.dart';
import 'package:api_news/apps/helper/share.dart';
import 'package:api_news/models/news.dart';
import 'package:api_news/models/settings.dart';
import 'package:api_news/repository/settings_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<int> listCheck = [];
  Future<void> init() async {
    listCheck =
        List<int>.from(await ShareCustom.getStringToList(ConstApp.keyListId));
    notifyListeners();
  }

  Future<List<Settings>> getAllSettings() async {
    return await SettingsRepository.getCategoryNews();
  }

  Future<List<News>> getNewsWithID(int id) async {
    return await SettingsRepository.getNewsWithID();
  }

  void handleCheckBox(int id) async {
    if (listCheck.contains(id)) {
      listCheck.remove(id);
    } else {
      listCheck.add(id);
    }

    ShareCustom.setString(ConstApp.keyListId, listCheck);
    notifyListeners();
  }
}
