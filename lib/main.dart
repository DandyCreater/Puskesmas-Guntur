import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:puskesmas_guntur/app/app.dart';
import './app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await di.init("");
  var path = Directory.current.path;
  Hive.init((await getApplicationDocumentsDirectory()).path);

  await Hive.openBox("User");
  runApp(MyApp());
}
