import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class BPJSPage extends StatelessWidget {
  const BPJSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.appBarColor,
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: ImageIcon(
            const AssetImage(
              'assets/icons/arrow_left.png',
            ),
            color: ColorManager.primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainPageRoute, (route) => false);
          },
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_comesoon.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
