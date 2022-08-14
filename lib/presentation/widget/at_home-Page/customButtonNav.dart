import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class CustomButtonNav extends StatelessWidget {
  final Function() press;
  final String imageUrl;
  final String title;
  final Color color;
  final Color backgroundColor;
  const CustomButtonNav(
      {Key? key,
      required this.press,
      required this.imageUrl,
      required this.title,
      required this.color,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: height * 0.12,
        width: width * 0.21,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.secondaryColor),
            shape: BoxShape.circle,
            color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              scale: 1.2,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              style: ThemeText.heading3.copyWith(color: color, fontSize: 9),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
