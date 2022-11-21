import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/app/injection_container.dart';
import 'package:puskesmas_guntur/data/model/carousel/carousel_model.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/carousel-Bloc/carousel_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/forgotpassword-Bloc/forgotpassword_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/hospital-Bloc/hospital_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/pelayanan-Bloc/pelayanan_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signUp-Bloc/sign_up_bloc.dart';
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
    final articleBloc = sl<ArticleBloc>()..add(FetchArticle());
    final carouselBloc = sl<CarouselBloc>()..add(FetchCarousel());
    final hospitalBloc = sl<HospitalBloc>()..add(FetchHospital());
    final pelayananBloc = sl<PelayananBloc>()..add(FetchPelayanan());
    final signInBloc = sl<SignInBloc>();
    final signUpBloc = sl<SignUpBloc>();
    final forgotPasswordBloc = sl<ForgotpasswordBloc>();

    return MultiBlocProvider(
      providers: [
        //Sign In Bloc
        BlocProvider(create: (_) => signInBloc),
        BlocProvider(create: (_) => signUpBloc),

        //Article Bloc
        BlocProvider(create: (_) => articleBloc),

        //Carousel Bloc
        BlocProvider(create: (_) => carouselBloc),

        //Pelayanan Bloc
        BlocProvider(create: (_) => pelayananBloc),

        //Hospital Bloc
        BlocProvider(create: (_) => hospitalBloc),

        //Forgot Password Bloc
        BlocProvider(create: (_) => forgotPasswordBloc)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
