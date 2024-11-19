import 'package:api_news/main.dart';
import 'package:api_news/models/settings.dart';
import 'package:api_news/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPages extends StatelessWidget {
  const SettingsPages({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List<Settings>>(
          future: context.read<SettingsProvider>().getAllSettings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            List data = List.of(snapshot.data ?? []);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 3 / 1,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                  child: Consumer<SettingsProvider>(builder: (_, provider, __) {
                    return CheckboxListTile(
                      title: Text(data[index].name),
                      value: provider.listCheck.contains(data[index].id),
                      onChanged: (_) {
                        provider.handleCheckBox(data[index].id);
                      },
                    );
                  }),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
