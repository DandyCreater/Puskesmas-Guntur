class PelayananEntity {
  String? responseStatus;
  OkContentPelayanEntity? okContentPelayan;
  String? failContent;

  PelayananEntity(
      {required this.responseStatus,
      required this.okContentPelayan,
      required this.failContent});

  PelayananEntity.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    okContentPelayan = json['OkContentPelayan'] != null
        ? new OkContentPelayanEntity.fromJson(json['OkContentPelayan'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.okContentPelayan != null) {
      data['OkContentPelayan'] = this.okContentPelayan!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OkContentPelayanEntity {
  List<PelayananListEntity>? pelayanan;

  OkContentPelayanEntity({required this.pelayanan});

  OkContentPelayanEntity.fromJson(Map<String, dynamic> json) {
    if (json['pelayanan'] != null) {
      pelayanan = <PelayananListEntity>[];
      json['pelayanan'].forEach((v) {
        pelayanan!.add(new PelayananListEntity.fromJson(v));
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
}

class PelayananListEntity {
  String? imageUrl;
  String? title;
  String? date;
  String? time;

  PelayananListEntity(
      {required this.imageUrl,
      required this.title,
      required this.date,
      required this.time});

  PelayananListEntity.fromJson(Map<String, dynamic> json) {
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
}
