import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_api/model/newsmodel.dart';

class TopTrendingController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;
  List<Article> newsArticle = [];
  String errorMessage = '';

  Future<void> topTrending() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=844b59f8440c4304b7e1fed07a65d685');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        newsModel = newsModelFromJson(response.body);
        if (newsModel != null) {
          newsArticle = newsModel!.articles ?? [];
        }
      } else {
        errorMessage = 'Failed to load news: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }

    isLoading = false;
    notifyListeners();
  }
}
