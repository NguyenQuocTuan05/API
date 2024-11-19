import 'package:api_news/apps/configs/app_color.dart';
import 'package:api_news/main.dart';
import 'package:api_news/pages/category/category_pages.dart';
import 'package:api_news/pages/home/home_pages.dart';
import 'package:api_news/pages/settings/settings_pages.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootsPages extends StatefulWidget {
  const RootsPages({super.key});

  @override
  State<RootsPages> createState() => _RootsPagesState();
}

class _RootsPagesState extends State<RootsPages> {
  List<Widget> listPages = [
    HomePages(idCategories: 1),
    const CategoryPages(),
    const SettingsPages(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<SettingsProvider>().scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColor.hightlightText),
              child: Image.asset("assets/images/ellipse.png"),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePages(idCategories: 1),
                ));
              },
            ),
            ListTile(
              title: const Text('Category'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CategoryPages(),
                ));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPages(),
                ));
              },
            ),
          ],
        ),
      ),
      body: HomePages(idCategories: 1),
    );
  }
}
