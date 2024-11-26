import 'package:api_news/apps/routers/routers_name.dart';
import 'package:api_news/models/news.dart';
import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              news.thumb,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                maxLines: 2,
                style: const TextStyle(color: Colors.amber),
              ),
              Text(
                news.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(news.publish_date),
            ],
          ),
        ),
      ],
    );
  }
}
