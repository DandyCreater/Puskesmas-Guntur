import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushNamed(context, Routes.signInRoute));
    super.initState();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
          body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.secondaryColor,
                ColorManager.primaryColor,
              ]),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: height * 0.35),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_2.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_1.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_3.png'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "SISTEM INFORMASI\nPUSKESMAS GUNTUR",
              style: ThemeText.heading1
                  .copyWith(color: ColorManager.backgroundColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.24,
            ),
            Text(
              "DINAS KESEHATAN\nPEMERINTAH KOTA GARUT",
              style: ThemeText.heading3
                  .copyWith(color: ColorManager.backgroundColor, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      )),
    );
  }
}
