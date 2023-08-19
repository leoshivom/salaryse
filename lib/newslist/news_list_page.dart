import 'package:flutter/material.dart';
import 'package:salaryseassignment/newslist/news_list_provider.dart';
import 'package:salaryseassignment/utils/error_widget.dart';

import '../network/response_state.dart';
import 'item_news_list.dart';
import 'news_list_skeleton.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsListProvider>(
      create: (context) => NewsListProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News List"),
        ),
        body: Consumer<NewsListProvider>(builder: (context, provider, child) {
          if (provider.responseState == ResponseState.loading) {
            return const NewsListSkeleton();
          } else if (provider.responseState == ResponseState.error) {
            return OopsWidget(onRetry: () {
              provider.getRes();
            });
          } else {
            if (provider.newsList != null) {
              var news = provider.newsList;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return ItemNews(news[index]);
                },
              );
            } else {
              return OopsWidget(onRetry: () {
                provider.getRes();
              });
            }
          }
        }),
      ),
    );
  }
}
