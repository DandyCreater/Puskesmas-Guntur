import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class TextFieldEditWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const TextFieldEditWidget(
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
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            title,
            style: ThemeText.heading2,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
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
        )
      ],
    );
  }
}
