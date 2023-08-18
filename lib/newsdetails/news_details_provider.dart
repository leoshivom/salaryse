import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:salaryseassignment/network/response_state.dart';
import '../model/news.dart';
import '../network/api.dart';

class NewsDetailsProvider extends ChangeNotifier {
  ResponseState _responseState = ResponseState.success;

  News _news;

  ResponseState get responseState => _responseState;

  News get news => _news;

  NewsDetailsProvider({num id}) {
    getRes(id);
  }

  void getRes(num id) async {
    _responseState = ResponseState.loading;
    notifyListeners();
    var response = await API.getNewsDetails(id: id);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      var map = Map<String, dynamic>.from(jsonData);
      _news = News.fromJson(map);
      _responseState = ResponseState.success;
      notifyListeners();
    } else {
      _responseState = ResponseState.error;
      notifyListeners();
    }
  }
}
