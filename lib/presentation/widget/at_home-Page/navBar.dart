import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: height * 0.22,
                decoration: BoxDecoration(color: ColorManager.secondaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorManager.secondaryColor,
                              size: 30,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 10, 5, 10),
                            fillColor: ColorManager.whiteTextColor,
                            hintText: "Search",
                            hintStyle: ThemeText.heading3.copyWith(
                              color: ColorManager.secondaryColor,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: ColorManager.secondaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ColorManager.secondaryColor)),
                          ),
                        ),
                      ),
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
                      onTap: () {},
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
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.signInRoute, (route) => false);
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
              Text(
                "Versi 1.0.0",
                style: ThemeText.heading2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
