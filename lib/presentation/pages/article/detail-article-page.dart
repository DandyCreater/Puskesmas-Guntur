import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class DetailArticlePage extends StatelessWidget {
  String title;
  String imageUrl;
  String puskesmas;
  String date;
  String time;
  String textContent;

  DetailArticlePage(
      {required this.title,
      required this.imageUrl,
      required this.puskesmas,
      required this.date,
      required this.time,
      required this.textContent});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget imageArticle() {
      return Container(
        width: width * 0.6,
        height: height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          imageUrl,
          scale: 1,
        ),
      );
    }

    Widget locationTime() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/user_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                puskesmas,
                style: ThemeText.heading4.copyWith(
                  fontSize: 10,
                  color: ColorManager.blackTextColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/calendar_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                date,
                style: ThemeText.heading4.copyWith(
                  fontSize: 10,
                  color: ColorManager.blackTextColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/time_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                time,
                style: ThemeText.heading4.copyWith(
                  fontSize: 10,
                  color: ColorManager.blackTextColor,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget shareSocMed() {
      return Row(
        children: [
          Text(
            'Share : ',
            style: ThemeText.heading4.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/telegram_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/icons/twitter_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/icons/whatsapp_icon.png',
                scale: 4,
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/icons/gmail_icon.png',
                scale: 4,
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
          child: Text(
            title.toUpperCase(),
            style: ThemeText.heading2.copyWith(
              color: ColorManager.blackTextColor,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
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
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(
            width: width * 0.15,
          ),
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                imageArticle(),
                const SizedBox(
                  height: 27,
                ),
                locationTime(),
                const SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    textContent,
                    style: ThemeText.heading4.copyWith(
                      color: ColorManager.blackTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                shareSocMed(),
              ],
            ),
          )),
    );
  }
}
