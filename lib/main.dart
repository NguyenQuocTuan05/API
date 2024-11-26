import 'package:api_news/apps/routers/routers_name.dart';
import 'package:api_news/pages/category/category_pages.dart';
import 'package:api_news/pages/home/home_pages.dart';
import 'package:api_news/pages/roots/roots_pages.dart';
import 'package:api_news/pages/settings/settings_pages.dart';
import 'package:api_news/provider/home_provider.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsProvider()..init(),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootsPages(),
      routes: {
        RoutersName.homePages: (_) => const HomePages(),
        RoutersName.categoryPages: (_) => const CategoryPages(),
        RoutersName.rootsPages: (_) => const RootsPages(),
        RoutersName.settingsPages: (_) => const SettingsPages(),
      },
    );
  }
}
