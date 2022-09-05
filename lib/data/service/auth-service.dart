import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    var data = Hive.box("User");
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);

      data.put("name", user.name);
      data.put("email", user.email);
      data.put("phone_num", user.phone_num);
      data.put("jenis_kelamin", user.jenis_kelamin);
      data.put("no_bpjs", user.no_bpjs);
      data.put("alamat", user.alamat);
      data.put("tgl_lahir", user.tgl_lahir);

      return user;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Future<UserModel> signOutWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signOut();

  //   UserCredential user = await _auth.signOut();
  // }

  Future<UserModel> singUpWithFacebook() async {
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
          alamat: "unknown",
          jenis_kelamin: "uknown",
          no_bpjs: "uknown",
          tgl_lahir: "unknown",
          phone_num: "unknown");

      await UserService().setUser(user);
      data.put("name", user.name);
      data.put("email", user.email);
      data.put("phone_num", user.phone_num);
      data.put("jenis_kelamin", user.jenis_kelamin);
      data.put("no_bpjs", user.no_bpjs);
      data.put("alamat", user.alamat);
      data.put("tgl_lahir", user.tgl_lahir);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUpWithGoogle() async {
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
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        UserModel user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            alamat: "unknown",
            jenis_kelamin: "unknown",
            no_bpjs: "unknown",
            tgl_lahir: "unknown",
            phone_num: "unknown");

        await UserService().setUser(user);
        data.put("name", user.name);
        data.put("email", user.email);
        data.put("phone_num", user.phone_num);
        data.put("jenis_kelamin", user.jenis_kelamin);
        data.put("no_bpjs", user.no_bpjs);
        data.put("alamat", user.alamat);
        data.put("tgl_lahir", user.tgl_lahir);
        return user;
      } else {
        return null!;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
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
          name: "unknown",
          alamat: "unknown",
          jenis_kelamin: "unknown",
          no_bpjs: "unknown",
          tgl_lahir: "unknown",
          phone_num: phone_num);

      await UserService().setUser(user);
      data.put("name", user.name);
      data.put("email", user.email);
      data.put("phone_num", user.phone_num);
      data.put("jenis_kelamin", user.jenis_kelamin);
      data.put("no_bpjs", user.no_bpjs);
      data.put("alamat", user.alamat);
      data.put("tgl_lahir", user.tgl_lahir);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future forgotPassword(String email) async {
    try {
      var reset = await _auth.sendPasswordResetEmail(email: email);
      return reset;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> updateUser({required UserModel user}) async {
    var data = Hive.box("User");
    try {
      User userCredential = _auth.currentUser!;
      UserModel users = UserModel(
          id: userCredential.uid,
          email: user.email,
          name: user.name,
          alamat: user.alamat,
          jenis_kelamin: user.jenis_kelamin,
          no_bpjs: user.no_bpjs,
          tgl_lahir: user.tgl_lahir,
          phone_num: user.phone_num);

      await UserService().updateUser(users);

      data.put("name", users.name);
      data.put("email", users.email);
      data.put("phone_num", users.phone_num);
      data.put("jenis_kelamin", users.jenis_kelamin);
      data.put("no_bpjs", users.no_bpjs);
      data.put("alamat", users.alamat);
      data.put("tgl_lahir", users.tgl_lahir);
      return users;
    } catch (e) {
      throw e;
    }
  }
}
