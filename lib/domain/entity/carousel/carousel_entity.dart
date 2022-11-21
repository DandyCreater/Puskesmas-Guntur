class CarouselEntity {
  String? responseStatus;
  OKContentCarouselEntity? oKContentCarousel;
  String? failContent;

  CarouselEntity(
      {required this.responseStatus,
      required this.oKContentCarousel,
      required this.failContent});

  CarouselEntity.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentCarousel = json['OKContentCarousel'] != null
        ? new OKContentCarouselEntity.fromJson(json['OKContentCarousel'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentCarousel != null) {
      data['OKContentCarousel'] = this.oKContentCarousel!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentCarouselEntity {
  List<CarouselListEntity>? carousel;

  OKContentCarouselEntity({required this.carousel});

  OKContentCarouselEntity.fromJson(Map<String, dynamic> json) {
    if (json['carousel'] != null) {
      carousel = <CarouselListEntity>[];
      json['carousel'].forEach((v) {
        carousel!.add(new CarouselListEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carousel != null) {
      data['carousel'] = this.carousel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarouselListEntity {
  String? imageUrl;
  String? title;

  CarouselListEntity({required this.imageUrl, required this.title});

  CarouselListEntity.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    return data;
  }
}
