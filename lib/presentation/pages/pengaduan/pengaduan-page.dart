import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_pengaduan-Page/TextFieldNumPengaduanWidget.dart';
import 'package:puskesmas_guntur/presentation/widget/at_pengaduan-Page/TextFieldPengaduanWidget.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldCustomWidget.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({Key? key}) : super(key: key);

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController bpjsController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PENGADUAN',
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
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: height * 0.78,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.whiteTextColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorManager.primaryColor.withOpacity(0.4),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.blackprimaryColor.withOpacity(0.2),
                  offset: const Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Layanan Pengaduan",
                  style: ThemeText.heading1.copyWith(
                      color: ColorManager.secondaryColor, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldPengaduanWidget(
                            title: "Name",
                            hintText: "Masukan Nama Lengkap",
                            controller: nameController),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFieldNumPengaduanWidget(
                            title: "Umur",
                            hintText: "Masukan Umur",
                            controller: umurController),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFieldPengaduanWidget(
                            title: "Alamat",
                            hintText: "Masukan Alamat Lengkap",
                            controller: alamatController),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFieldNumPengaduanWidget(
                            title: "NIK",
                            hintText: "Masukan NIK",
                            controller: nikController),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFieldNumPengaduanWidget(
                            title: "No.BPJS",
                            hintText: "Masukan No.BPJS",
                            controller: bpjsController),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFieldPengaduanWidget(
                            title: "Keluhan",
                            hintText: "Masukan Keluhan",
                            controller: keluhanController),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        ColorManager.secondaryColor)),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.mainPageRoute, (route) => false);
                                },
                                child: Text(
                                  "SUBMIT",
                                  style: ThemeText.heading2.copyWith(
                                      color: ColorManager.whiteTextColor),
                                ),
                              )),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
