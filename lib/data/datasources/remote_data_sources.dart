// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/data/utils/helper/user_helper.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';

abstract class RemoteDataSources {
  Future signIn({required String email, required String password});
  Future signUpWithFacebook();
  Future signUpWithGoogle();
  Future signUp(
      {required String email,
      required String password,
      required String phone_num});
  Future forgotPassword(String email);
  Future updateUser(UserModel userModel);
}

class RemoteDataSourcesImpl implements RemoteDataSources {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final userHelper = UserHelper();

  @override
  Future signIn({required String email, required String password}) async {
    var data = Hive.box("User");

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = await userHelper.getUserById(userCredential.user!.uid);

      data.put("name", user.name);
      data.put("email", user.email);
      data.put("phone_num", user.phone_num);
      data.put("jenis_kelamin", user.jenis_kelamin);
      data.put("no_bpjs", user.no_bpjs);
      data.put("alamat", user.alamat);
      data.put("tgl_lahir", user.tgl_lahir);

      debugPrint("Data User : $user");
      return user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error SignIn : ${e.code}");
      if (e.code == "wrong-password") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Username / Password Salah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      return e;
    }
  }

  @override
  Future signUpWithFacebook() async {
    var data = Hive.box("User");
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'birthday']);

    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      UserModel user = UserModel(
          email: userCredential.user!.email,
          name: userCredential.user!.displayName,
          alamat: "",
          jenis_kelamin: "",
          no_bpjs: "",
          tgl_lahir: "",
          phone_num: "");

      UserModel finalUser = await userHelper.setUser(user);
      return finalUser;
    } on FirebaseAuthException catch (e) {
      debugPrint("ERROR CATCH FACEBOOK SIGN IN $e");
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      return e;
    }
  }

  @override
  Future signUpWithGoogle() async {
    var data = Hive.box("User");
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    try {
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        UserModel userData =
            await userHelper.getUserById(userCredential.user!.uid);

        UserModel user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            alamat: userData.alamat,
            jenis_kelamin: userData.jenis_kelamin,
            no_bpjs: userData.no_bpjs,
            tgl_lahir: userData.tgl_lahir,
            phone_num: userData.phone_num);

        await userHelper.setUser(user);
        data.put("name", user.name);
        data.put("email", user.email);
        data.put("phone_num", user.phone_num);
        data.put("jenis_kelamin", user.jenis_kelamin);
        data.put("no_bpjs", user.no_bpjs);
        data.put("alamat", user.alamat);
        data.put("tgl_lahir", user.tgl_lahir);
        return user;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Catch Error Sign in Google $e");
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      return e;
    }
  }

  @override
  Future signUp(
      {required String email,
      required String password,
      required String phone_num}) async {
    try {
      var data = Hive.box("User");
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: 'unknown',
          alamat: 'unknown',
          jenis_kelamin: 'unknown',
          no_bpjs: 'unknown',
          tgl_lahir: 'unknown',
          phone_num: phone_num);

      await userHelper.setUser(user);

      data.put("name", user.name);
      data.put("email", user.email);
      data.put("phone_num", user.phone_num);
      data.put("jenis_kelamin", user.jenis_kelamin);
      data.put("no_bpjs", user.no_bpjs);
      data.put("alamat", user.alamat);
      data.put("tgl_lahir", user.tgl_lahir);
      return user;
    } on FirebaseAuthException catch (e) {
      debugPrint("Catch Error Sign Up ${e.code}");
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      if (e.code == "email-already-in-use") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Email Sudah Terdaftar",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }

      return e;
    }
  }

  @override
  Future forgotPassword(String email) async {
    try {
      var reset = await _auth.sendPasswordResetEmail(email: email);
      return reset;
    } on FirebaseAuthException catch (e) {
      debugPrint("Catch Error Forgot Password $e");
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
    }
  }

  @override
  Future updateUser(UserModel userModel) async {
    var data = Hive.box("User");
    try {
      User userCredential = _auth.currentUser!;
      UserModel users = UserModel(
          id: userCredential.uid,
          email: userModel.email,
          name: userModel.name,
          alamat: userModel.alamat,
          jenis_kelamin: userModel.jenis_kelamin,
          no_bpjs: userModel.no_bpjs,
          tgl_lahir: userModel.tgl_lahir,
          phone_num: userModel.phone_num);

      await userHelper.updateUser(users);
      data.put("name", users.name);
      data.put("email", users.email);
      data.put("phone_num", users.phone_num);
      data.put("jenis_kelamin", users.jenis_kelamin);
      data.put("no_bpjs", users.no_bpjs);
      data.put("alamat", users.alamat);
      data.put("tgl_lahir", users.tgl_lahir);
      return users;
    } on FirebaseAuthException catch (e) {
      debugPrint("Catch Error Update User $e");
      if (e.code == "network-request-failed") {
        UserModel user = UserModel(
            id: null,
            email: "",
            name: "Koneksi Bermasalah",
            alamat: "",
            jenis_kelamin: "",
            no_bpjs: "",
            tgl_lahir: "",
            phone_num: "");
        return user;
      }
      return e;
    }
  }
}
