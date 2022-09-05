// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _animatedWidth = 10.0;
  late bool loggedIn;

  loading() {
    setState(() {
      _animatedWidth = MediaQuery.of(context).size.width;
    });
  }

  initStatus() {
    var data = Hive.box("User");

    data == null ? "" : data == data;
    loggedIn =
        data.get("loginSession") == null ? false : data.get("loginSession");
    print("log IN" + loggedIn.toString());
    if (loggedIn == true) {
      Future.delayed(const Duration(seconds: 10))
          .then((value) => Navigator.pushNamed(context, Routes.mainPageRoute));
    } else {
      Future.delayed(const Duration(seconds: 10))
          .then((value) => Navigator.pushNamed(context, Routes.signInRoute));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          loading();
          initStatus();
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _animatedWidth = double.infinity;
                      });
                    },
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.2,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo_3.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: Text(
                  "SISTEM INFORMASI\nPUSKESMAS GUNTUR",
                  style: ThemeText.heading1
                      .copyWith(color: ColorManager.backgroundColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.18,
              ),
              Center(
                child: Text(
                  "DINAS KESEHATAN\nPEMERINTAH KOTA GARUT",
                  style: ThemeText.heading3.copyWith(
                      color: ColorManager.backgroundColor, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Stack(
                children: [
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.appBarColor),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 10),
                    height: 8,
                    width: _animatedWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.secondaryColor),
                  ),
                ],
              )
            ]),
          ),
        ),
      )),
    );
  }
}
