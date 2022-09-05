import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:puskesmas_guntur/app/app.dart';
import 'package:puskesmas_guntur/domain/model/user-model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var path = Directory.current.path;
  Hive.init((await getApplicationDocumentsDirectory()).path);

  await Hive.openBox("User");
  runApp(MyApp());
}
