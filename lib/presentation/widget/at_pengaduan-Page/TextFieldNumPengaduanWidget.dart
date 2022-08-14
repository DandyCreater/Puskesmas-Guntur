import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class TextFieldNumPengaduanWidget extends StatelessWidget {
  final String title;
  final String hintText;
  TextEditingController controller;
  TextFieldNumPengaduanWidget(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: ThemeText.heading3
                    .copyWith(color: ColorManager.blackTextColor),
              ),
              TextSpan(
                text: '*',
                style: ThemeText.heading3
                    .copyWith(color: ColorManager.redTextColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              hintText: hintText,
              hintStyle: ThemeText.heading3,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      ],
    );
  }
}
