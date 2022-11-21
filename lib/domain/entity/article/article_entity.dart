class ArticleEntity {
  String? responseStatus;
  OKContentArticleEntity? oKContentArticle;
  String? failContent;

  ArticleEntity(
      {required this.responseStatus,
      required this.oKContentArticle,
      required this.failContent});

  ArticleEntity.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentArticle = json['OKContentArticle'] != null
        ? new OKContentArticleEntity.fromJson(json['OKContentArticle'])
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

class OKContentArticleEntity {
  List<ArticleListEntity>? article;

  OKContentArticleEntity({required this.article});

  OKContentArticleEntity.fromJson(Map<String, dynamic> json) {
    if (json['article'] != null) {
      article = <ArticleListEntity>[];
      json['article'].forEach((v) {
        article!.add(new ArticleListEntity.fromJson(v));
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

class ArticleListEntity {
  String? header;
  String? imageUrl;
  String? category;
  String? date;
  String? time;
  String? description;

  ArticleListEntity(
      {required this.header,
      required this.category,
      required this.imageUrl,
      required this.date,
      required this.time,
      required this.description});

  ArticleListEntity.fromJson(Map<String, dynamic> json) {
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
