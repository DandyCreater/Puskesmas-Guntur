class HospitalEntity {
  String? responseStatus;
  OKContentHospitalEntity? oKContentHospital;

  HospitalEntity(
      {required this.responseStatus, required this.oKContentHospital});

  HospitalEntity.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentHospital = json['OKContentHospital'] != null
        ? new OKContentHospitalEntity.fromJson(json['OKContentHospital'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentHospital != null) {
      data['OKContentHospital'] = this.oKContentHospital!.toJson();
    }
    return data;
  }
}

class OKContentHospitalEntity {
  List<HospitalListEntity>? hospital;

  OKContentHospitalEntity({required this.hospital});

  OKContentHospitalEntity.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <HospitalListEntity>[];
      json['hospital'].forEach((v) {
        hospital!.add(new HospitalListEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HospitalListEntity {
  String? imageUrl;
  String? title;
  String? address;
  String? noTelp;

  HospitalListEntity(
      {required this.imageUrl,
      required this.title,
      required this.address,
      required this.noTelp});

  HospitalListEntity.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    address = json['address'];
    noTelp = json['noTelp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['address'] = this.address;
    data['noTelp'] = this.noTelp;
    return data;
  }
}
