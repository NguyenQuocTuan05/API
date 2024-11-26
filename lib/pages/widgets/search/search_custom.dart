import 'package:api_news/main.dart';
import 'package:api_news/models/news.dart';
import 'package:api_news/pages/widgets/new_widget.dart';
import 'package:api_news/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCustom extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: context.read<HomeProvider>().search(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<News> data = snapshot.data as List<News>;
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
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
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListTile(
      title: const Text('123'),
      onTap: () {},
    );
  }
}
