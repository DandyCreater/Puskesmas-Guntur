import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TENTANG KAMI',
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
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/carousel_1.png"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "A. Sejarah UPT Puskesmas Guntur Garut",
                  style: ThemeText.heading2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Puskesmas Guntur merupakan salah satu Puskesmas di Dinas Kesehatan Kabupaten Garut yang terletak  ± 2 KM, dari Pusat kota Garut, tepatnya di Kelurahan Kota wetan. Kecamatan Garut Kota Kabupaten Garut. UPT Puskesmas Guntur yang awalnya berdiri di kelurahan Sukamentri sebagai Puskesms Satelit (Pukesmas bantu Puskesmas Siliwangi) tepatnya di depan pasar Baru yang sekarangjadi GP Pasar domba dan pemotongan hewan .yang sekarangjadi Gedung PKL.\n\nPuskesmas Guntur didrikan Pada Tahun1980, sebagai Pukesmas Satelit (Pustu Puskesmas Siliwangi ) dan pada tahun 1982 menjadi puskesmas penuh dengan nama puskesmas Guntur pada tahun 1984 Puskesmas Guntur mendirikan puskesmas pembantu di wilayah desasuka mentriyng bernama pustu sukamentri. Pada tahun 2004 akhir, Puskesmas Guntur di pindahkan ke Gedung Kantor Dinas Koprasi dan mulai Beroprasi pada awal tahun 2005 sampai sekarang, sedangkan Gedung Puskesmas Guntur yang lama di alih fungsikan menjadi pusat perdagangan kaki lima (PKL).",
                  style: ThemeText.heading3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "B. Data Geografi",
                  style: ThemeText.heading2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "PuskesmasGuntur Kec. Garut Kota berdiri di ketinggian 400 M dari permukaan laut, dengan suhu udara rata-rata 23-28Oc. Meliputi Tiga ( 3 ) kelurahanYaitu : kelurahan. Ciwalen, kelurahan Kota wetan dan kelurahan Sukamentri. Puskesmas Guntur Memiliki luas wilayah kerja =199 km2 dengan Jumlah Penduduk di wilayah kerjaPuskesmas Guntur 43299 Jiwa.lk.\n\nPenduduk di wilayah kerjapuskesmas Guntur bersipat heterogen dengan mayoritas bermata pencaharian sebagai kaum pedagang Puskesmas adalah Unit Pelaksana Teknis Dinas Kesehatan Kabupaten / Kota yang bertanggung jawab terhadap pembangunan kesehatan di wilayah kerjanya.Puskesmas berperan menyelenggarakan upaya kesehatan meningkatkan kesadaran, kemauan dan kemampuan hidup sehat bagi penduduk,agar memperoleh derajat kesehatan yang optimal. Demikian Puskesmas berfungsi sebagai pusat penggerak pembangunan berwawasan kesehatan,pusat pemberdayaan keluarga dan masyarakat serta pusat pelayanan kesehatan strata pertama.",
                  style: ThemeText.heading3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/about_us_content.png"),
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
