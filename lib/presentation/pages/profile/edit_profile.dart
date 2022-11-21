// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puskesmas_guntur/data/model/user/user_model.dart';
import 'package:puskesmas_guntur/presentation/bloc/signIn-Bloc/sign_in_bloc.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldEditWidget.dart';
import 'package:puskesmas_guntur/presentation/widget/at_profile-Page/TextFieldNumberWidget.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({
    this.name,
    this.email,
    this.phoneNum,
    this.gender,
    this.bornDate,
    this.bpjsNum,
    this.address,
    Key? key,
  }) : super(
          key: key,
        );

  String? name;
  String? email;
  String? phoneNum;
  String? gender;
  String? bornDate;
  String? bpjsNum;
  String? address;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  TextEditingController bornDateController = TextEditingController();
  TextEditingController bpjsNumController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime selectedTime = DateTime.now();
  String genderValue = "Laki-laki";

  _profileCondition() {
    nameController.text = widget.name.toString();
    emailController.text = widget.email.toString();
    phoneNumController.text = widget.phoneNum.toString();
    genderValue = widget.gender.toString();
    genderValue == "unknown"
        ? genderValue = "Laki-laki"
        : genderValue = genderValue;
    bornDateController.text = widget.bornDate.toString();
    bpjsNumController.text = widget.bpjsNum.toString();
    addressController.text = widget.address.toString();
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? newSelected = await showDatePicker(
      context: context,
      initialDate: selectedTime,
      firstDate: DateTime(1945),
      lastDate: DateTime(2045),
    );

    if (newSelected != null && newSelected != selectedTime) {
      selectedTime = newSelected;
      bornDateController.text =
          dateFormat.format(selectedTime.toLocal()).split(" ")[0];
    }
  }

  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(
      child: Text("Laki-laki"),
      value: "Laki-laki",
    ),
    const DropdownMenuItem(
      child: Text("Perempuan"),
      value: "Perempuan",
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    _profileCondition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
            SizedBox(
              height: height * 0.055,
              child: TextField(
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
                    contentPadding: const EdgeInsets.fromLTRB(10, 9, 5, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
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
            SizedBox(
              height: height * 0.055,
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                      isDense: true,
                      isCollapsed: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  items: items,
                  value: genderValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      genderValue = newValue!;
                    });
                  }),
            ),
          ],
        );

    Widget tglLahir() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                "TANGGAL LAHIR",
                style: ThemeText.heading2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: height * 0.055,
              child: TextField(
                readOnly: true,
                controller: bornDateController,
                decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    suffixIcon: GestureDetector(
                      onTap: () => selectDate(context),
                      child: Icon(
                        Icons.calendar_month,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
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
              BlocProvider.of<SignInBloc>(context).add(UpdateUser(
                  user: UserModel(
                      email: emailController.text,
                      name: nameController.text,
                      alamat: addressController.text,
                      jenis_kelamin: genderValue,
                      no_bpjs: bpjsNumController.text,
                      tgl_lahir: bornDateController.text,
                      phone_num: phoneNumController.text)));
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
              controller: nameController,
            ),
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
            jenisKelamin(),
            SizedBox(
              height: height * 0.02,
            ),
            tglLahir(),
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
