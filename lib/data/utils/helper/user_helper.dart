// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';

class UserHelper {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'alamat': user.alamat,
        'no_bpjs': user.no_bpjs,
        'tgl_lahir': user.tgl_lahir,
        'jenis_kelamin': user.jenis_kelamin,
        'phone_num': user.phone_num,
      });
    } catch (e) {
      debugPrint("ERROR WHEN SET USER HELPER $e");
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      _userReference.doc(user.id).update({
        'name': user.name,
        'email': user.email,
        'alamat': user.alamat,
        'no_bpjs': user.no_bpjs,
        'tgl_lahir': user.tgl_lahir,
        'jenis_kelamin': user.jenis_kelamin,
        'phone_num': user.phone_num,
      });
    } catch (e) {
      debugPrint("ERROR WHEN UPDATE USER HELPER $e");
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
          id: id,
          email: (snapshot.data() as dynamic)['email'],
          name: (snapshot.data() as dynamic)['name'],
          alamat: (snapshot.data() as dynamic)['alamat'],
          jenis_kelamin: (snapshot.data() as dynamic)['jenis_kelamin'],
          no_bpjs: (snapshot.data() as dynamic)['no_bpjs'],
          tgl_lahir: (snapshot.data() as dynamic)['tgl_lahir'],
          phone_num: (snapshot.data() as dynamic)['phone_num']);
    } catch (e) {
      debugPrint("ERROR WHEN GET USER BY ID HELPER $e");
      throw e;
    }
  }
}
