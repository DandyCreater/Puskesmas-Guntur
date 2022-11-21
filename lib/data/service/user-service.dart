// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

// class UserService {
//   final CollectionReference _userRefference =
//       FirebaseFirestore.instance.collection('user');

//   Future<void> setUser(UserModel user) async {
//     try {
//       _userRefference.doc(user.id).set({
//         'name': user.name,
//         'email': user.email,
//         'alamat': user.alamat,
//         'no_bpjs': user.no_bpjs,
//         'tgl_lahir': user.tgl_lahir,
//         'jenis_kelamin': user.jenis_kelamin,
//         'phone_num': user.phone_num,
//       });
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<void> updateUser(UserModel user) async {
//     try {
//       _userRefference.doc(user.id).update({
//         'name': user.name,
//         'email': user.email,
//         'alamat': user.alamat,
//         'no_bpjs': user.no_bpjs,
//         'tgl_lahir': user.tgl_lahir,
//         'jenis_kelamin': user.jenis_kelamin,
//         'phone_num': user.phone_num,
//       });
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<UserModel> getUserById(String id) async {
//     try {
//       DocumentSnapshot snapshot = await _userRefference.doc(id).get();
//       return UserModel(
//           id: id,
//           email: (snapshot.data() as dynamic)['email'],
//           name: (snapshot.data() as dynamic)['name'],
//           alamat: (snapshot.data() as dynamic)['alamat'],
//           jenis_kelamin: (snapshot.data() as dynamic)['jenis_kelamin'],
//           no_bpjs: (snapshot.data() as dynamic)['no_bpjs'],
//           tgl_lahir: (snapshot.data() as dynamic)['tgl_lahir'],
//           phone_num: (snapshot.data() as dynamic)['phone_num']);
//     } catch (e) {
//       throw e;
//     }
//   }
// }
