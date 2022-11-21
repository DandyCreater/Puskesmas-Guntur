// ignore_for_file: unnecessary_this

import 'package:puskesmas_guntur/domain/entity/pelayanan/pelayanan_entity.dart';

class PelayananModel {
  String? responseStatus;
  OkContentPelayan? okContentPelayan;
  String? failContent;

  PelayananModel(
      {this.responseStatus, this.okContentPelayan, this.failContent});

  PelayananModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    okContentPelayan = json['OKContentPelayan'] != null
        ? new OkContentPelayan.fromJson(json['OKContentPelayan'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.okContentPelayan != null) {
      data['OKContentPelayan'] = this.okContentPelayan!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }

  PelayananEntity toEntity() {
    return PelayananEntity(
        responseStatus: this.responseStatus,
        okContentPelayan: this.okContentPelayan != null
            ? this.okContentPelayan!.toEntity()
            : null,
        failContent: this.failContent);
  }
}

class OkContentPelayan {
  List<Pelayanan>? pelayanan;

  OkContentPelayan({this.pelayanan});

  OkContentPelayan.fromJson(Map<String, dynamic> json) {
    if (json['pelayanan'] != null) {
      pelayanan = <Pelayanan>[];
      json['pelayanan'].forEach((v) {
        pelayanan!.add(new Pelayanan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pelayanan != null) {
      data['pelayanan'] = this.pelayanan!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OkContentPelayanEntity toEntity() {
    return OkContentPelayanEntity(
        pelayanan: this.pelayanan != null
            ? this.pelayanan!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Pelayanan {
  String? imageUrl;
  String? title;
  String? date;
  String? time;

  Pelayanan({this.imageUrl, this.title, this.date, this.time});

  Pelayanan.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }

  PelayananListEntity toEntity() {
    return PelayananListEntity(
        imageUrl: this.imageUrl,
        title: this.title,
        date: this.date,
        time: this.time);
  }
}
