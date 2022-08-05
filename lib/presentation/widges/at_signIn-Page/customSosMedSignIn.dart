import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class CustomSosMedSignIn extends StatelessWidget {
  final Function() press;
  final String imageUrl;
  final String title;

  const CustomSosMedSignIn(
      {Key? key,
      required this.press,
      required this.imageUrl,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.backgroundColor,
            border: Border.all(color: ColorManager.blackprimaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              scale: 2,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: ThemeText.heading3,
            ),
          ],
        ),
      ),
    );
  }
}
