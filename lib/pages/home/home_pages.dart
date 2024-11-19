import 'package:api_news/apps/configs/app_color.dart';
import 'package:api_news/apps/routers/routers_name.dart';
import 'package:api_news/models/news.dart';
import 'package:api_news/pages/category/category_pages.dart';
import 'package:api_news/pages/home/widgets/girdlist.dart';
import 'package:api_news/pages/roots/roots_pages.dart';
import 'package:api_news/pages/settings/settings_pages.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePages extends StatelessWidget {
  HomePages({super.key, required this.idCategories});
  int idCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.hightlightText),
              child: Image.asset('assets/images/menu.png'),
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.hightlightText),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<SettingsProvider>().getNewsWithID(idCategories),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<News> data = snapshot.data as List<News>;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 33,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data[0].category['name'],
                        style: const TextStyle(
                            color: AppColor.textColor, fontSize: 30),
                      ),
                    ),
                    const Text(
                      'View all',
                      style: TextStyle(color: AppColor.hightlightText),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Consumer<SettingsProvider>(
                    builder: (_, provider, __) {
                      return ListView.separated(
                        itemCount: provider.listCheck.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                Image.network(
                                  data[index].thumb,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        data[index].title,
                                        style: const TextStyle(
                                          color: AppColor.hightlightText,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        data[index].content,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        data[index].publish_date,
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
