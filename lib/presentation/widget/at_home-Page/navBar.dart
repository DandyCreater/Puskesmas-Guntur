import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    deleteDrawer() {
      var data = Hive.box("User");
      data.put("loginSession", false);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.signInRoute, (route) => false);
    }

    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.03),
                height: height * 0.15,
                decoration: BoxDecoration(color: ColorManager.secondaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logo_3.png",
                          scale: 2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "UPT\nPuskesmas Guntur\nGarut Jawa Barat",
                          style: ThemeText.heading1.copyWith(
                              color: ColorManager.whiteTextColor, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profileRoute);
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_profile.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Profile",
                            style: ThemeText.heading2,
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_pelayanan.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Pelayanan",
                            style: ThemeText.heading2,
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.contactRoute);
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_contact.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Kontak",
                            style: ThemeText.heading2,
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.infoAppsRoute);
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_importance.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Tentang Aplikasi",
                            style: ThemeText.heading2,
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        deleteDrawer();
                      },
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon_logout.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "Sign Out",
                            style: ThemeText.heading2,
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.14,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Versi 1.0.0",
                  style: ThemeText.heading2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
