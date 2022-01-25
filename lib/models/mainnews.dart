class NewsModel {
  late String title;
  String? author;
  String? published_date;
  String? published_date_precision;
  String? link;
  String? clean_url;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  List? authors;
  String? media;
  bool? is_opinion;
  String? twitter_account;
  double? score;
  String? id;

  NewsModel({
    this.author,
    this.clean_url,
    required this.title,
    this.published_date,
    this.published_date_precision,
    this.link,
    this.twitter_account,
    this.authors,
    this.country,
    this.id,
    this.is_opinion,
    this.language,
    this.media,
    this.rank,
    this.rights,
    this.score,
    this.summary,
    this.topic,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      authors: json['authors'],
      clean_url: json['clean_url'],
      country: json['country'],
      id: json['_id'],
      is_opinion: json['is_opinion'],
      language: json['language'],
      link: json['link'],
      media: json['media'],
      published_date: json['published_date'],
      published_date_precision: json['published_date_precision'],
      rank: json['rank'],
      rights: json['rights'],
      score: json['_score'],
      summary: json['summary'],
      title: json['title'],
      topic: json['topic'],
      twitter_account: json['twitter_account'],
    );
  }
}
