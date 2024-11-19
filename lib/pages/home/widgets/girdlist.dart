import 'package:api_news/apps/configs/app_color.dart';
import 'package:flutter/material.dart';

class Girdlist extends StatelessWidget {
   Girdlist({super.key,required this.idCategories});
  int idCategories;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'assets/images/sport.png',
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Political',
                  style: TextStyle(
                    color: AppColor.hightlightText,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Jordan expresses its condolences to the government and people of the friendly Republic of Indonesia for the victims of   ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Mar.5.2023',
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
