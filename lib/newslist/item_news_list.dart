import 'package:flutter/material.dart';
import 'package:salaryseassignment/utils/app_colors.dart';
import 'package:salaryseassignment/utils/util.dart';

import '../model/news.dart';
import '../newsdetails/news_details_page.dart';
import '../utils/my_card.dart';

class ItemNews extends StatelessWidget {
  final News _news;

  const ItemNews(this._news, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Util.openNavigator(context, NewsDetailsPage(news: _news));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 5,
          right: 5,
          bottom: 5,
        ),
        child: MyCard(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _news.title,
                  style: TextStyle(fontSize: 20, color: AppColors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _news.body,
                  // "${widget.logsData.astrologer.name}?",
                  style: TextStyle(
                      fontSize: 14, color: AppColors.black.withOpacity(0.9)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Util.openNavigator(
                            context, NewsDetailsPage(news: _news));
                      },
                      child: Text(
                        "View Details",
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.9)),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
