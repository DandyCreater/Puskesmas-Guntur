import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:puskesmas_guntur/data/service/user-service.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
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

  Future<UserModel> signUpWithGoogle() async {
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

        return user;
      } else {
        print("Kamu Disini");
        return null!;
      }
    } catch (e) {
      print("Ke Catch");
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String phone_num}) async {
    try {
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
      return users;
    } catch (e) {
      throw e;
    }
  }
}
