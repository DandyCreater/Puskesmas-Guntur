import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

class LoginHelper {
  Future<String> loginProcess(String email, String password) async {
    String result = "Process Loading";
    String userEmail = "Email";
    String userPassword = "Password";
    final jsonData = await rootBundle.loadString("assets/json/user.json");
    final dataDecode = jsonDecode(jsonData);
    var data = OKContentUser.fromJson(dataDecode["OKContentUser"]);

    List<User>? oldData = data.user;
    List<User>? finalData = [];

    var check = oldData!
        .where((element) =>
            element.email!.toLowerCase().contains(email) &&
            element.password!.toLowerCase().contains(password))
        .toList();
    for (var items in check) {
      finalData.add(items);
    }

    for (var loginItems in finalData) {
      userEmail = loginItems.email!.toString();
      userPassword = loginItems.password!.toString();
    }

    if (email != userEmail && password != userPassword) {
      result = "Username / Password Salah";
    } else {
      result = "Login Berhasil";
    }
    return result;
  }
}
