// ignore_for_file: unnecessary_this

import 'package:equatable/equatable.dart';
import 'package:puskesmas_guntur/domain/entity/user/user_entity.dart';

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

  UserEntity toEntity() {
    return UserEntity(
        email: this.email,
        name: this.name,
        alamat: this.alamat,
        jenis_kelamin: this.jenis_kelamin,
        no_bpjs: this.no_bpjs,
        tgl_lahir: this.tgl_lahir,
        phone_num: this.phone_num);
  }
}
