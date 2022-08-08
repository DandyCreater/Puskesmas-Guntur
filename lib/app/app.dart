import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        //Sign In Bloc
        BlocProvider(create: ((_) => SignInBloc())),

        //Article Bloc
        BlocProvider(create: ((_) => ArticleBloc()..add(FetchArticle())))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
