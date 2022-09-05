import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/forgotpassword-Bloc/forgotpassword_bloc.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  _showAlertDialog(BuildContext context, String message) {
    Widget acceptButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("OK", style: ThemeText.heading3),
    );

    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text("Reset Password Gagal", style: ThemeText.heading2),
      ),
      content: Text(message, style: ThemeText.heading3),
      actions: [
        acceptButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  _condition() {
    if (emailController.text.isEmpty) {
      _showAlertDialog(context, "Alamat Email tidak boleh kosong!");
    } else if (emailController.text.length < 6) {
      _showAlertDialog(context, "Harap Masukan dengan format email yang benar");
      emailController.text = "";
    } else {
      BlocProvider.of<ForgotpasswordBloc>(context)
          .add(FetchForgotPassword(email: emailController.text));
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.resetPasswordRoute, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteTextColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.blackprimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Input Your Email Address",
                style: ThemeText.heading2,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: ColorManager.blackprimaryColor,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 13, 5, 0),
                  hintText: "Input Your Email Address",
                  hintStyle: ThemeText.heading3.copyWith(
                      color: ColorManager.blackTextColor.withOpacity(0.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: ColorManager.blackprimaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: ColorManager.blackprimaryColor)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorManager.secondaryColor)),
                    onPressed: () {
                      _condition();
                    },
                    child: Text(
                      "Reset Password",
                      style: ThemeText.heading2
                          .copyWith(color: ColorManager.whiteTextColor),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
