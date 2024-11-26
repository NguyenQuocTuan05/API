import 'package:api_news/models/news.dart';
import 'package:api_news/models/settings.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class SettingsRepository {
  static Future<List<Settings>> getCategoryNews() async {
    try {
      final dio = Dio();
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
      final response = await dio.get(
          'https://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc');
      List<dynamic> data = response.data;
      List<Settings> result =
          data.map((e) => Settings.fromMap(e as Map<String, dynamic>)).toList();
      return result;
    } catch (e) {
      print('getCategoryNews :::: $e');
      rethrow;
    }
  }

  static Future<List<News>> getNewsWithID(int id) async {
    try {
      final dio = Dio();
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
      final response = await dio.get(
          'https://apiforlearning.zendvn.com/api/categories_news/$id/articles?offset=0&limit=10&sort_by=id&sort_dir=desc');
      List<dynamic> data = response.data;
      List<News> result =
          data.map((e) => News.fromMap(e as Map<String, dynamic>)).toList();
      return result;
    } catch (e) {
      print('getCategoryNews :::: $e');
      rethrow;
    }
  }
}
