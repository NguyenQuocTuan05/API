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
    const HomePages(),
    const CategoryPages(),
    const SettingsPages(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<SettingsProvider>().scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xff22CFFE),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    "assets/images/ellipse.png",
                  ),
                ),
                const Text(
                  'App Tin Tức',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 28,
                  color: selectedIndex == 0 ? Colors.white : Colors.amber,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePages(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Category',
                style: TextStyle(
                  fontSize: 28,
                  color: selectedIndex == 1 ? Colors.white : Colors.amber,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CategoryPages(),
                ));
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
                  color: selectedIndex == 2 ? Colors.white : Colors.amber,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPages(),
                ));
              },
            ),
          ],
        ),
      ),
      body: const HomePages(),
    );
  }
}
