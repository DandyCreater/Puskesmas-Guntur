import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puskesmas_guntur/presentation/pages/article/article-page.dart';
import 'package:puskesmas_guntur/presentation/pages/sign-in/signin-page.dart';
import 'package:puskesmas_guntur/presentation/pages/sign-up/signup-page.dart';
import 'package:puskesmas_guntur/presentation/pages/splashpage/splashpage.dart';

class Routes {
  static const String splashRoute = "/";
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String articleRoute = '/article';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.signInRoute:
        return PageTransition(
          child: const SignInPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.signUpRoute:
        return PageTransition(
          child: const SignUpPage(),
          type: PageTransitionType.leftToRightWithFade,
          duration: const Duration(seconds: 1),
        );
      case Routes.articleRoute:
        return PageTransition(
          child: const ArticlePage(),
          type: PageTransitionType.leftToRightWithFade,
          duration: const Duration(seconds: 1),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Route Tidak ada",
                ),
              ),
              body: const Center(child: Text("No Routes Found")),
            ));
  }
}
