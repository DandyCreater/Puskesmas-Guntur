// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldCustomWidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: ThemeText.heading2.copyWith(
            color: ColorManager.blackTextColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorManager.appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: ImageIcon(
            const AssetImage(
              'assets/icons/arrow_left.png',
            ),
            color: ColorManager.primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Routes.mainPageRoute);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: height * 0.8,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.whiteTextColor,
                boxShadow: [
                  BoxShadow(
                      color: ColorManager.blackprimaryColor.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      spreadRadius: 1,
                      blurRadius: 1)
                ]),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Image.asset("assets/icons/icon_accounts.png"),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Text(
                      "ASEP WIBOWO",
                      style: ThemeText.heading1.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Text(
                      "22 Tahun, Pria",
                      style: ThemeText.heading3.copyWith(
                          color: ColorManager.blackTextColor.withOpacity(0.2)),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Center(
                    child: SizedBox(
                        width: width * 0.26,
                        height: height * 0.04,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorManager.primaryColor)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.editProfileRoute);
                          },
                          child: Text(
                            "Edit Profil",
                            style: ThemeText.heading2.copyWith(
                                fontSize: 12,
                                color: ColorManager.whiteTextColor),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // ignore: prefer_const_constructors
                  TextFieldCustomWidget(
                      title: "Email", hintText: "loremipsum@gmail.com"),
                  TextFieldCustomWidget(
                      title: "NOMOR PONSEL", hintText: "62896110724"),
                  TextFieldCustomWidget(
                      title: "JENIS KELAMIN", hintText: "Pria"),
                  TextFieldCustomWidget(
                      title: "TANGGAL LAHIR", hintText: "22/01/1997"),
                  TextFieldCustomWidget(
                      title: "NOMOR BPJS", hintText: "0402480285"),
                  TextFieldCustomWidget(
                      title: "ALAMAT",
                      hintText:
                          "Kp.Cinta Damai Kel.Lorem Ipsum RT.xx RW.xx Jawa Barat Indonesia"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
