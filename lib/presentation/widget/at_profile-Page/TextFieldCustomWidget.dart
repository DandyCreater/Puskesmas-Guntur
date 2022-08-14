import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final String title;
  final String hintText;
  const TextFieldCustomWidget(
      {Key? key, required this.title, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ThemeText.heading3
              .copyWith(color: ColorManager.blackprimaryColor.withOpacity(0.2)),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: height * 0.05,
          child: TextField(
            enabled: false,
            readOnly: true,
            decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: ThemeText.heading3
                    .copyWith(color: ColorManager.blackprimaryColor),
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0)),
          ),
        ),
      ],
    );
  }
}
