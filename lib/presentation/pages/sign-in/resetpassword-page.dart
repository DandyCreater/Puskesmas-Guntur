import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.signInRoute, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your reset password request has been Sent to your email address, check your email to continue your password reset ,",
                style: ThemeText.heading3,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: width,
              height: height * 0.05,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStateProperty.all(ColorManager.secondaryColor)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.signInRoute, (route) => false);
                },
                child: Text(
                  "Back to Login Page",
                  style: ThemeText.heading3.copyWith(
                    color: ColorManager.whiteTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
