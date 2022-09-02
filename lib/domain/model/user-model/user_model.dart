// class UserModel {
//   String? responseStatus;
//   OKContentUser? oKContentUser;

//   UserModel({this.responseStatus, this.oKContentUser});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     responseStatus = json['ResponseStatus'];
//     oKContentUser = json['OKContentUser'] != null
//         ? new OKContentUser.fromJson(json['OKContentUser'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ResponseStatus'] = this.responseStatus;
//     if (this.oKContentUser != null) {
//       data['OKContentUser'] = this.oKContentUser!.toJson();
//     }
//     return data;
//   }
// }

// class OKContentUser {
//   List<User>? user;

//   OKContentUser({this.user});

//   OKContentUser.fromJson(Map<String, dynamic> json) {
//     if (json['user'] != null) {
//       user = <User>[];
//       json['user'].forEach((v) {
//         user!.add(new User.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class User {
//   String? email;
//   String? password;
//   String? name;
//   String? age;
//   String? gender;
//   String? phoneNum;
//   String? bornDate;
//   String? bpjsNum;
//   String? address;

//   User(
//       {this.email,
//       this.password,
//       this.name,
//       this.age,
//       this.gender,
//       this.phoneNum,
//       this.bornDate,
//       this.bpjsNum,
//       this.address});

//   User.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//     name = json['name'];
//     age = json['age'];
//     gender = json['gender'];
//     phoneNum = json['phoneNum'];
//     bornDate = json['bornDate'];
//     bpjsNum = json['bpjsNum'];
//     address = json['address'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['name'] = this.name;
//     data['age'] = this.age;
//     data['gender'] = this.gender;
//     data['phoneNum'] = this.phoneNum;
//     data['bornDate'] = this.bornDate;
//     data['bpjsNum'] = this.bpjsNum;
//     data['address'] = this.address;
//     return data;
//   }
// }

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String? id;
  String? email;
  String? name;
  String? alamat;
  String? jenis_kelamin;
  String? no_bpjs;
  String? tgl_lahir;
  String? phone_num;

  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.alamat,
    required this.jenis_kelamin,
    required this.no_bpjs,
    required this.tgl_lahir,
    required this.phone_num,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id!,
        email!,
        name!,
        alamat!,
        jenis_kelamin!,
        no_bpjs!,
        tgl_lahir!,
        phone_num!
      ];
}
