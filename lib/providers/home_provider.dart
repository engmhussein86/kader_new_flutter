import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/models/all_news_response.dart';
import 'package:kader_new_flutter_app/providers/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllNews();
  }

  List<AllNewsResponse> allLastNews;


  getAllNews() async {
    allLastNews = await HomeApiHelper.apiHelper.getLastNews();
    notifyListeners();
  }



}