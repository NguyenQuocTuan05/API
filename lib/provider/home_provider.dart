import 'package:api_news/models/news.dart';
import 'package:api_news/repository/search_repository.dart';
import 'package:api_news/repository/settings_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Future<List<News>> getNewsWithID(int id) async {
    return await SettingsRepository.getNewsWithID(id);
  }

  Future<List<News>> search(String query) async {
    return await SearchRepository.search(query);
  }
}
