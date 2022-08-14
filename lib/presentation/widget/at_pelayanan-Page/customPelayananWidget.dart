import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class CustomPelayananPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String day;
  final String hours;
  const CustomPelayananPage(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.day,
      required this.hours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.blackprimaryColor.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.whiteTextColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10),
              height: 50,
              width: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: ColorManager.primaryColor, width: 3)),
              child: Image.asset(imageUrl)),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: ThemeText.heading2,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  day,
                  style: ThemeText.heading3,
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Jam",
                      style: ThemeText.heading2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      hours,
                      style: ThemeText.heading3,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
