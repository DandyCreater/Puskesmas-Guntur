import 'package:flutter/material.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';

class ArticleCard extends StatelessWidget {
  String imageUrl;
  String title;
  String category;
  String date;

  ArticleCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.category,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailArticlePage(
                    title: title,
                    imageUrl: imageUrl,
                    puskesmas: 'Puskesmas Guntur',
                    date: date,
                    time: '08.58 PM',
                    textContent:
                        'Monitoring dan evaluasi yang dilakukan oleh Bagian Organisasi Sekretariat Daerah melakukan monitoring dan evaluasi penyelenggaraan pelayanan public di bidang Kesehatan, merupakan salah satu bentuk pengawasan dan pengendalian eksternal  mencakup aspek administratif, sumber daya, pencapaian kinerja program dan teknis pelayanan. Tujuan dari kegiatan monitoring dan evaluasi ini antara lain adalah untuk mengetahui sejauh mana pelaksanaan pelayanan kesehatan, apakah sesuai dengan standar rencana kerja, apakah sumber daya telah ada dan digunakan sesuai dengan yang telah ditetapkan, mengetahui adanya kendala, hambatan dalam melaksanakan pelayanan kesehatan, sehingga dapat ditetapkan pemecahan masalah sedini mungkin, mengetahui ada penyimpangan pelaksanaan pelayanan kesehatan sehingga segera dilakukan klarifikasi, memberikan informasi kepada pengambil keputusan tentang adanya penyimpangan dan penyebabnya, sehingga dapat diambil keputusan untuk melakukan koreksi pada pelaksanaan kegiatan, memberikan informasi/laporan kepada pengambil keputusan tentang adanya perubahan-perubahan lingkungan yang harus ditindaklanjuti dengan penyesuaian kegiatan dan memberikan informasi  akuntabilitas pelaksanaan dan hasil kinerja program/kegiatan kepada pihak yang berkepentingan, secara kontinyu dari waktu ke waktu.Monev Juga dilakukan terhadap pemenuhan variabel dan atribut pelayanan publik yang dinilai oleh Ombudsman setiap tahunnya serta evaluasi atas pelaksanaan Survei Kepuasan Masyarakat.Semoga dengan Pelaksanaan Monev CPP ini kami bisa semakin meningkatkan kualitas pelayanan kami kepada masyarakat.')));
      },
      child: Container(
        width: double.infinity,
        height: height * 0.22,
        padding: const EdgeInsets.fromLTRB(5, 9, 5, 9),
        margin: const EdgeInsets.only(top: 33),
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
                  scale: 2,
                )),
            const SizedBox(
              width: 22,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ThemeText.heading2,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    category,
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
                        Expanded(
                          child: Text(
                            'READ MORE >>',
                            style: ThemeText.heading4.copyWith(
                              color: ColorManager.primaryColor,
                            ),
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
    );
  }
}
