import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static API _instance;
  static const baseUrlForUriLive = "jsonplaceholder.typicode.com";

  static getBaseUrlForUri() {
    return baseUrlForUriLive;
  }

  static getInstance() async {
    _instance ??= API();
    return _instance;
  }

  static getNews() {
    final uri = getUri(endpoint: "/posts");
    return http.get(uri, headers: {"Content-Type": "application/json"});
  }

  static getNewsDetails({num id}) {
    final uri = getUri(endpoint: "/posts/$id");
    return http.get(uri, headers: {"Content-Type": "application/json"});
  }

  static getUri({
    String endpoint,
  }) {
    return Uri.https(API.getBaseUrlForUri(), endpoint);
  }
}
