import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/models/all_news_response.dart';
import 'package:kader_new_flutter_app/providers/api_helper.dart';

class NewsProvider extends ChangeNotifier {
  NewsProvider() {
    getAllNews();

  }

  List<AllNewsResponse> allNews;
  getAllNews() async {
    allNews = await HomeApiHelper.apiHelper.getAllNews();
    notifyListeners();
  }
  getSearchNews(String word) async {
    allNews = await HomeApiHelper.apiHelper.getSearchNews(word);
    notifyListeners();
  }
}