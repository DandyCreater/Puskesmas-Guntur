import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class CustomHospitalCardWidget extends StatelessWidget {
  Function() press;
  String imageUrl;
  String title;
  String location;
  String number;

  CustomHospitalCardWidget(
      {Key? key,
      required this.press,
      required this.imageUrl,
      required this.title,
      required this.location,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.22,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.025, vertical: height * 0.02),
            decoration: BoxDecoration(
              color: ColorManager.whiteTextColor,
              border: Border.all(
                  color: ColorManager.blackprimaryColor.withOpacity(0.04),
                  width: 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: const Color(0xffFFFFFF).withOpacity(0.57),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: height * 0.5,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ThemeText.heading3.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/icon_address.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            location,
                            style: ThemeText.heading4.copyWith(
                              color: ColorManager.blackTextColor,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/icon_phone.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            number,
                            style: ThemeText.heading4.copyWith(
                              color: ColorManager.blackTextColor,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}
