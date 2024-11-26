import 'package:api_news/main.dart';
import 'package:api_news/models/news.dart';
import 'package:api_news/pages/widgets/new_widget.dart';
import 'package:api_news/provider/home_provider.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key, required this.idCategory});
  int idCategory;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HomeProvider>().getNewsWithID(idCategory),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<News> data = snapshot.data as List<News>;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(data[0].category['name']),
                ),
                const Text('Show all'),
              ],
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return AspectRatio(
                  aspectRatio: 3 / 1,
                  child: NewWidget(
                    news: data[index],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
