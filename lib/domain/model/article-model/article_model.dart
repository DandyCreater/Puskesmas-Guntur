class ArticleModel {
  String? responseStatus;
  OKContentArticle? oKContentArticle;
  String? failContent;

  ArticleModel({this.responseStatus, this.oKContentArticle, this.failContent});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentArticle = json['OKContentArticle'] != null
        ? new OKContentArticle.fromJson(json['OKContentArticle'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentArticle != null) {
      data['OKContentArticle'] = this.oKContentArticle!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentArticle {
  List<Article>? article;

  OKContentArticle({this.article});

  OKContentArticle.fromJson(Map<String, dynamic> json) {
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(new Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  String? header;
  String? imageUrl;
  String? category;
  String? date;
  String? time;
  String? description;

  Article(
      {this.header,
      this.category,
      this.imageUrl,
      this.date,
      this.time,
      this.description});

  Article.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    imageUrl = json['imageUrl'];
    category = json['category'];
    date = json['date'];
    time = json['time'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['imageUrl'] = this.imageUrl;
    data['category'] = this.category;
    data['date'] = this.date;
    data['time'] = this.time;
    data['description'] = this.description;
    return data;
  }
}
