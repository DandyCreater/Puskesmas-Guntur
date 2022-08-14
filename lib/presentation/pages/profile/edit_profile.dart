import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldEditWidget.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldNumberWidget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bornDateController = TextEditingController();
  TextEditingController bpjsNumController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget name() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "NAMA",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Nama Lengkap",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget email() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "EMAIL",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Masukan Alamat Email",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget phoneNum() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "NOMOR TELEPON",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: phoneNumController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 40,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: ColorManager.blackprimaryColor))),
                    child: Center(
                      child: Text(
                        "+62",
                        style: ThemeText.heading3,
                      ),
                    ),
                  ),
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Masukan Nomor Telepon",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget jenisKelamin() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "JENIS KELAMIN",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: genderController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Pilih Jenis Kelamin",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget tanggalLahir() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "Tanggal Lahir",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: bornDateController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "DD/MM/YYYY",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget bpjs() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "NOMOR BPJS",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: bpjsNumController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Masukan Nomor BPJS",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    Widget Alamat() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "ALAMAT",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Masukan Alamat Lengkap",
                  hintStyle: ThemeText.heading3,
                  contentPadding: const EdgeInsets.fromLTRB(10, 14, 5, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EDIT PROFILE',
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
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.mainPageRoute, (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  "SIMPAN",
                  style: ThemeText.heading2
                      .copyWith(color: ColorManager.blueSaveTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.03,
            ),
            Center(child: Image.asset("assets/icons/icon_add.png")),
            SizedBox(
              height: height * 0.03,
            ),
            TextFieldEditWidget(
                title: "NAMA",
                hintText: "Nama Lengkap",
                controller: nameController),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldEditWidget(
                title: "EMAIL",
                hintText: "Masukan Alamat Email",
                controller: emailController),
            SizedBox(
              height: height * 0.02,
            ),
            phoneNum(),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldEditWidget(
                title: "JENIS KELAMIN",
                hintText: "Pilih Jenis Kelamin",
                controller: genderController),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldNumEditWidget(
                title: "TANGGAL LAHIR",
                hintText: "DD/MM/YYYY",
                controller: bornDateController),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldNumEditWidget(
                title: "NOMOR BPJS",
                hintText: "Masukan Nomor BPJS",
                controller: bpjsNumController),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldEditWidget(
                title: "ALAMAT",
                hintText: "Masukan Alamat Lengkap",
                controller: addressController),
            SizedBox(
              height: height * 0.02,
            ),
          ]),
        ),
      ),
    );
  }
}
