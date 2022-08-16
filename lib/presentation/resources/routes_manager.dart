import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puskesmas_guntur/presentation/pages/article/article-page.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/pages/contact/contact_page.dart';
import 'package:puskesmas_guntur/presentation/pages/homepage/homepage.dart';
import 'package:puskesmas_guntur/presentation/pages/info-aplikasi/infoaplikasi-page.dart';
import 'package:puskesmas_guntur/presentation/pages/mainpage.dart';
import 'package:puskesmas_guntur/presentation/pages/pelayanan/pelayanan-page.dart';
import 'package:puskesmas_guntur/presentation/pages/pengaduan/pengaduan-page.dart';
import 'package:puskesmas_guntur/presentation/pages/profile/edit_profile.dart';
import 'package:puskesmas_guntur/presentation/pages/profile/profile_page.dart';
import 'package:puskesmas_guntur/presentation/pages/sign-in/signin-page.dart';
import 'package:puskesmas_guntur/presentation/pages/sign-up/signup-page.dart';
import 'package:puskesmas_guntur/presentation/pages/splashpage/splashpage.dart';
import 'package:puskesmas_guntur/presentation/pages/tentang-kami/tentangkami_page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String articleRoute = '/article';
  static const String mainPageRoute = '/main';
  static const String homePageRoute = '/home';
  static const String profileRoute = 'profile';
  static const String jadwalDokterRoute = '/jadwal';
  static const String tentangkamiRoute = '/tentang';
  static const String pelayananRoute = '/pelayanan';
  static const String contactRoute = '/contact';
  static const String editProfileRoute = '/edit';
  static const String pengaduanRoute = '/pengaduan';
  static const String infoAppsRoute = '/info';
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
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.tentangkamiRoute:
        return PageTransition(
          child: const TentangKamiPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.pelayananRoute:
        return PageTransition(
          child: const PelayananPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.contactRoute:
        return PageTransition(
          child: const ContactPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.editProfileRoute:
        return PageTransition(
          child: const EditProfilePage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.pengaduanRoute:
        return PageTransition(
          child: const PengaduanPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.infoAppsRoute:
        return PageTransition(
          child: const InfoAplikasiPage(),
          type: PageTransitionType.fade,
          duration: const Duration(seconds: 1),
        );
      case Routes.mainPageRoute:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager.appBarColor,
                iconTheme: IconThemeData(
                  color: ColorManager.secondaryColor,
                ),
              ),
              body: Center(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_comesoon.png"),
                        fit: BoxFit.cover)),
              )),
            ));
  }
}
