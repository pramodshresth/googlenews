import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_news/api/api.dart';
import 'package:google_news/models/init_state.dart';
import 'package:google_news/models/mainnews.dart';

final newsProvider =
    StateNotifierProvider<NewsProvider, MainState>((ref) => NewsProvider());

class NewsProvider extends StateNotifier<MainState> {
  NewsProvider() : super(MainState.initial()) {
    getNews();
  }

  Future<void> getNews() async {
    if (state.category == Category.getWorld) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getSport) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getBusiness) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel>? newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getHealth) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getNation) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getScience) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    } else if (state.category == Category.getTechnology) {
      final response = await NewsService.getNews(state.category);
      final extractData = jsonDecode(response.body);
      List<NewsModel> newNews = (extractData['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      state = state.copyWith(news: newNews);
    }
  }

  void updateCategory(String category) {
    state = state.copyWith(news: [], category: category);
    getNews();
  }
}
