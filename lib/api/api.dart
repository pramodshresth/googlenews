import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsService {
  static Future<Response> getNews(String? category) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://free-news.p.rapidapi.com/v1/search?lang=en&q=$category"),
        headers: {
          "x-rapidapi-host": "free-news.p.rapidapi.com",
          "x-rapidapi-key":
              "c5b83d4587msh612a3d9d44b67d8p16918djsn10224f26f569",
        },
      );

      return response;
    } catch (e) {
      throw e;
    }
  }
}
