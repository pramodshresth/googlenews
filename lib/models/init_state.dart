import 'package:google_news/models/mainnews.dart';

class Category {
  static const getBusiness = 'Business';
  static const getWorld = 'World';
  static const getSport = 'sport';
  static const getNation = 'Nation';
  static const getTechnology = 'Technology';
  static const getEntertaintment = 'Entertaintment';
  static const getScience = 'Science';
  static const getHealth = 'Health';
}

class MainState {
  String? category;
  List<NewsModel>? news;

  MainState({this.category, this.news});

  MainState.initial()
      : category = Category.getWorld,
        news = [];

  MainState copyWith({String? category, List<NewsModel>? news}) {
    return MainState(
      category: category ?? this.category,
      news: news ?? this.news,
    );
  }
}
