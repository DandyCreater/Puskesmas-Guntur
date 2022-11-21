// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
import 'package:puskesmas_guntur/presentation/pages/profile/edit_profile.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldCustomWidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = '';
  String name = '';
  String alamat = '';
  String jenis_kelamin = '';
  String no_bpjs = '';
  String tgl_lahir = "";
  String phone_num = "";

  getData() async {
    var data = Hive.box("User");

    email = data.get("email");
    name = data.get("name");
    alamat = data.get("alamat");
    jenis_kelamin = data.get("jenis_kelamin");
    no_bpjs = data.get("no_bpjs");
    tgl_lahir = data.get("tgl_lahir");
    phone_num = data.get("phone_num");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

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
                      name,
                      style: ThemeText.heading1.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Text(
                      "22 Tahun, $jenis_kelamin",
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
                            // BlocProvider.of<SignInBloc>(context)
                            //     .add(UpdateUser());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => EditProfilePage(
                                          name: name,
                                          email: email,
                                          address: alamat,
                                          bpjsNum: no_bpjs,
                                          phoneNum: phone_num,
                                          gender: jenis_kelamin,
                                          bornDate: tgl_lahir,
                                        ))));
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
                  TextFieldCustomWidget(title: "Email", hintText: email),
                  TextFieldCustomWidget(
                      title: "NOMOR PONSEL",
                      // ignore: prefer_interpolation_to_compose_strings
                      hintText: "+62" + phone_num),
                  TextFieldCustomWidget(
                      title: "JENIS KELAMIN", hintText: jenis_kelamin),
                  TextFieldCustomWidget(
                      title: "TANGGAL LAHIR", hintText: tgl_lahir),
                  TextFieldCustomWidget(title: "NOMOR BPJS", hintText: no_bpjs),
                  TextFieldCustomWidget(title: "ALAMAT", hintText: alamat),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
