// ignore_for_file: unnecessary_this

import 'package:puskesmas_guntur/domain/entity/carousel/carousel_entity.dart';

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

  CarouselEntity toEntity() {
    return CarouselEntity(
        responseStatus: this.responseStatus,
        oKContentCarousel: this.oKContentCarousel != null
            ? this.oKContentCarousel!.toEntity()
            : null,
        failContent: this.failContent);
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

  OKContentCarouselEntity toEntity() {
    return OKContentCarouselEntity(
        carousel: this.carousel != null
            ? this.carousel!.map((e) => e.toEntity()).toList()
            : null);
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

  CarouselListEntity toEntity() {
    return CarouselListEntity(imageUrl: this.imageUrl, title: this.title);
  }
}
