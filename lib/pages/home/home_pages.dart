import 'package:api_news/apps/configs/app_color.dart';
import 'package:api_news/apps/routers/routers_name.dart';
import 'package:api_news/models/news.dart';
import 'package:api_news/pages/category/category_pages.dart';
import 'package:api_news/pages/home/widgets/home_category.dart';
import 'package:api_news/pages/roots/roots_pages.dart';
import 'package:api_news/pages/settings/settings_pages.dart';
import 'package:api_news/pages/widgets/search/search_custom.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePages extends StatelessWidget {
  const HomePages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              context
                  .read<SettingsProvider>()
                  .scaffoldKey
                  .currentState
                  ?.openDrawer();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.hightlightText),
              child: Image.asset('assets/images/menu.png'),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await showSearch(context: context, delegate: SearchCustom());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.hightlightText),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SettingsProvider>(
              builder: (_, provider, __) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: provider.listCheck.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return HomeCategory(
                      idCategory: provider.listCheck[index],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
