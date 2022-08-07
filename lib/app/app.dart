import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._instance();
  int appState = 0;
  static final MyApp instance = MyApp._instance();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.articleRoute,
    );
  }
}
