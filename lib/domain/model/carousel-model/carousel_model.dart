class CarouselModel {
  String? responseStatus;
  OKContentCarousel? oKContentCarousel;
  String? failContent;

  CarouselModel(
      {this.responseStatus, this.oKContentCarousel, this.failContent});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentCarousel = json['OKContentCarousel'] != null
        ? new OKContentCarousel.fromJson(json['OKContentCarousel'])
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

class OKContentCarousel {
  List<Carousel>? carousel;

  OKContentCarousel({this.carousel});

  OKContentCarousel.fromJson(Map<String, dynamic> json) {
    if (json['carousel'] != null) {
      carousel = <Carousel>[];
      json['carousel'].forEach((v) {
        carousel!.add(new Carousel.fromJson(v));
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

class Carousel {
  String? imageUrl;
  String? title;

  Carousel({this.imageUrl, this.title});

  Carousel.fromJson(Map<String, dynamic> json) {
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
