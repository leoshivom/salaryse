import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salaryseassignment/network/response_state.dart';
import '../model/news.dart';
import '../network/api.dart';

class NewsListProvider extends ChangeNotifier {
  ResponseState _responseState = ResponseState.success;

  List<News> _list;

  ResponseState get responseState => _responseState;

  List<News> get newsList => _list;

  NewsListProvider() {
    getRes();
  }

  void getRes() async {
    _responseState = ResponseState.loading;
    notifyListeners();
    var response = await API.getNews();
    if (response.statusCode == 200 || response.statusCode == 201) {
      _list = parsePosts(response.body);
      _responseState = ResponseState.success;
      notifyListeners();
    } else {
      _responseState = ResponseState.error;
      notifyListeners();
    }
  }

  List<News> parsePosts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  }
}
