// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KONTAK',
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: height * 0.56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 1,
                        color: ColorManager.blackprimaryColor.withOpacity(0.2),
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "HUBUNGI KAMI",
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset("assets/icons/icon_phone.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("(0262)232265",
                        style: ThemeText.heading2.copyWith(fontSize: 14)),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset("assets/icons/icon_whatsapp.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("08211783987",
                        style: ThemeText.heading2.copyWith(fontSize: 14)),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset("assets/icons/icon_address.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Jl. Guntur No.234, Kota Wetan, Kec. Garut Kota, Kabupaten Garut, Jawa Barat 44111",
                      style: ThemeText.heading2.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset("assets/icons/icon_gmail.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Puskesmasguntur234@gmail.com",
                      style: ThemeText.heading2.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "PETA LOKASI",
                style: ThemeText.heading2,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/maps.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
