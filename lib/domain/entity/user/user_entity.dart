import 'package:equatable/equatable.dart';

class UserEntity {
  String? id;
  String? email;
  String? name;
  String? alamat;
  String? jenis_kelamin;
  String? no_bpjs;
  String? tgl_lahir;
  String? phone_num;

  UserEntity({
    this.id,
    required this.email,
    required this.name,
    required this.alamat,
    required this.jenis_kelamin,
    required this.no_bpjs,
    required this.tgl_lahir,
    required this.phone_num,
  });
}
