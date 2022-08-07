import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/widges/at_article-Page/article_card.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ARTIKEL',
          style: ThemeText.heading2.copyWith(
            color: ColorManager.blackTextColor,
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
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(29, 0, 40, 31),
          children: [
            ArticleCard(
              imageUrl: 'assets/images/article_img_1.png',
              title: 'Monev Pelayanan Publik UPT Puskesmas Guntur',
              category: 'Aktivitas',
              date: 'Agustus 03, 2022',
            ),
            ArticleCard(
              imageUrl: 'assets/images/article_img_2.png',
              title: 'Bulan Imunisasi Anak Nasional (BIAN)',
              category: 'Aktivitas',
              date: 'Agustus 01, 2022',
            ),
            ArticleCard(
              imageUrl: 'assets/images/article_img_3.png',
              title: 'Kunjungan Rumah pada penderita tB',
              category: 'Kunjungan',
              date: 'Juli 22, 2022',
            ),
            ArticleCard(
              imageUrl: 'assets/images/article_img_4.png',
              title: 'Mengenali gerd dan cara mengatasinya',
              category: 'Kesehatan',
              date: 'juli 14, 2022',
            ),
          ]),
    );
  }
}
