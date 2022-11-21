// ignore_for_file: unnecessary_this

import 'package:puskesmas_guntur/domain/entity/hospital/hospital_entity.dart';

class HospitalModel {
  String? responseStatus;
  OKContentHospital? oKContentHospital;

  HospitalModel({this.responseStatus, this.oKContentHospital});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentHospital = json['OKContentHospital'] != null
        ? new OKContentHospital.fromJson(json['OKContentHospital'])
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

  HospitalEntity toEntity() {
    return HospitalEntity(
        responseStatus: this.responseStatus,
        oKContentHospital: this.oKContentHospital != null
            ? this.oKContentHospital!.toEntity()
            : null);
  }
}

class OKContentHospital {
  List<Hospital>? hospital;

  OKContentHospital({this.hospital});

  OKContentHospital.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
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

  OKContentHospitalEntity toEntity() {
    return OKContentHospitalEntity(
        hospital: this.hospital != null
            ? this.hospital!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Hospital {
  String? imageUrl;
  String? title;
  String? address;
  String? noTelp;

  Hospital({this.imageUrl, this.title, this.address, this.noTelp});

  Hospital.fromJson(Map<String, dynamic> json) {
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

  HospitalListEntity toEntity() {
    return HospitalListEntity(
      imageUrl: this.imageUrl,
      title: this.title,
      address: this.address,
      noTelp: this.noTelp,
    );
  }
}
