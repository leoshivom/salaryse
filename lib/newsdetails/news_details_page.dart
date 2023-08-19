import 'package:flutter/material.dart';
import 'package:salaryseassignment/utils/error_widget.dart';

import '../network/response_state.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';
import 'news_details_provider.dart';

class NewsDetailsPage extends StatefulWidget {
  final news;

  const NewsDetailsPage({Key key, this.news}) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsDetailsProvider>(
      create: (context) => NewsDetailsProvider(id: widget.news.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News Details"),
        ),
        body:
            Consumer<NewsDetailsProvider>(builder: (context, provider, child) {
          if (provider.responseState == ResponseState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.responseState == ResponseState.error) {
            return OopsWidget(onRetry: () {
              provider.getRes(widget.news.id);
            });
          } else {
            if (provider.news != null) {
              var news = provider.news;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: TextStyle(fontSize: 20, color: AppColors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.body,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.9)),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
            } else {
              return OopsWidget(onRetry: () {
                provider.getRes(widget.news.id);
              });
            }
          }
        }),
      ),
    );
  }
}
