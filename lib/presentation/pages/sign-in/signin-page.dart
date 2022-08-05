// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widges/at_signIn-Page/customSosMedSignIn.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObsecure = false;
  bool _isChecked = true;

  _obsecured() {
    _isObsecure = !_isObsecure;
    setState(() {});
  }

  _checked() {
    _isChecked = !_isChecked;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _obsecured();
    _checked();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget email() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: ThemeText.heading2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: ColorManager.backgroundColor,
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 10, 10),
                  hintText: "Enter Your Email",
                  hintStyle: ThemeText.heading3.copyWith(
                      color: ColorManager.blackprimaryColor.withOpacity(0.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: ColorManager.blackprimaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: ColorManager.blackprimaryColor))),
            )
          ],
        );

    Widget password() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: ThemeText.heading2,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              obscureText: _isObsecure,
              decoration: InputDecoration(
                  fillColor: ColorManager.backgroundColor,
                  isCollapsed: true,
                  isDense: true,
                  suffixIcon: GestureDetector(
                    onTap: _obsecured,
                    child: _isObsecure
                        ? Icon(
                            Icons.visibility,
                            color:
                                ColorManager.blackprimaryColor.withOpacity(0.2),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color:
                                ColorManager.blackprimaryColor.withOpacity(0.2),
                          ),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 10, 10),
                  hintText: "Enter Your Password",
                  hintStyle: ThemeText.heading3
                      .copyWith(color: Colors.black.withOpacity(0.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black))),
            )
          ],
        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.085,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo",
                          style: ThemeText.heading1
                              .copyWith(color: ColorManager.secondaryColor),
                        ),
                        Row(
                          children: [
                            Text(
                              "Selamat Datang",
                              style: ThemeText.heading2
                                  .copyWith(color: ColorManager.secondaryColor),
                            ),
                            Image.asset(
                              "assets/icons/hand_icon.png",
                              scale: 1.5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.085,
                    width: 4,
                    decoration: BoxDecoration(
                        color: ColorManager.secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: height * 0.085,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo_3.png",
                            scale: 2.1,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "UPT\nPuskemas Guntur\nGarut Jawa Barat",
                            style: ThemeText.heading3
                                .copyWith(color: ColorManager.primaryColor),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.06,
              ),
              email(),
              SizedBox(
                height: height * 0.015,
              ),
              password(),
              SizedBox(
                height: height * 0.015,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _checked,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: ColorManager.backgroundColor,
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                color: ColorManager.blackprimaryColor),
                          ),
                          child: _isChecked
                              ? Icon(
                                  Icons.check,
                                  color: ColorManager.secondaryColor,
                                )
                              : Container(),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Remember Me",
                        style: ThemeText.heading2,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: ThemeText.heading3
                          .copyWith(color: ColorManager.redTextColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                  height: height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorManager.primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: Text(
                      "LOGIN",
                      style: ThemeText.heading2.copyWith(
                        color: ColorManager.whiteTextColor,
                      ),
                    ),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.25,
                    height: 2,
                    decoration: BoxDecoration(
                      color: ColorManager.blackprimaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    "Or Login With",
                    style: ThemeText.heading2,
                  ),
                  Container(
                    width: width * 0.25,
                    height: 2,
                    decoration: BoxDecoration(
                      color: ColorManager.blackprimaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CustomSosMedSignIn(
                    imageUrl: "assets/icons/facebook_icon.png",
                    title: "Facebook",
                    press: () {},
                  ),
                  CustomSosMedSignIn(
                    imageUrl: "assets/icons/google_icon.png",
                    title: "Google",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account? ",
                    style: ThemeText.heading3,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.signUpRoute),
                    child: Text(
                      "Sign Up",
                      style: ThemeText.heading3
                          .copyWith(color: ColorManager.primaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
