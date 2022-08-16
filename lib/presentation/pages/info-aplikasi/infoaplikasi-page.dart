import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class InfoAplikasiPage extends StatelessWidget {
  const InfoAplikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Center(
              child: Text(
                "INFO APLIKASI",
                style: ThemeText.heading1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 260,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img_robot.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Versi",
                  style: ThemeText.heading2.copyWith(fontSize: 14),
                ),
                Text(
                  "1.0.0",
                  style: ThemeText.heading3.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ukuran",
                  style: ThemeText.heading2.copyWith(fontSize: 14),
                ),
                Text(
                  "4.68 MB",
                  style: ThemeText.heading3.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "OS Wajib",
                  style: ThemeText.heading2.copyWith(fontSize: 14),
                ),
                Text(
                  "Android 5.1 Dan Yang Lebih Baru",
                  style: ThemeText.heading3.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ditawarkan Oleh",
                  style: ThemeText.heading2.copyWith(fontSize: 14),
                ),
                Text(
                  "Puskesmas Guntur",
                  style: ThemeText.heading3.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dirilis",
                  style: ThemeText.heading2.copyWith(fontSize: 14),
                ),
                Text(
                  "17 Agustus 2022",
                  style: ThemeText.heading3.copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
