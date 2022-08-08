import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class ArticleCard extends StatelessWidget {
  Function() press;
  String imageUrl;
  String title;
  String activity;
  String date;

  ArticleCard(
      {Key? key,
      required this.press,
      required this.imageUrl,
      required this.title,
      required this.activity,
      required this.date})
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
            padding: const EdgeInsets.fromLTRB(5, 9, 5, 9),
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      scale: 3.5,
                    )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ThemeText.heading3
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        activity,
                        style: ThemeText.heading4.copyWith(
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date,
                              style: ThemeText.heading4.copyWith(
                                color: ColorManager.blackprimaryColor,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'READ MORE >>',
                              style: ThemeText.heading4.copyWith(
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
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
