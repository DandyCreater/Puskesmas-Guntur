// ignore_for_file: unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/carousel-Bloc/carousel_bloc.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_article-Page/article_card.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/customButtonNav.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/customPelayanan.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/navBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController controller = ScrollController(initialScrollOffset: 0);
  double scrollController = 0.0;
  var index = 0;

  _listener() {
    final aboutScroll = controller.position.minScrollExtent;
    final pelayananScroll = controller.position.maxScrollExtent * 0.5;
    final artikelScroll = controller.position.maxScrollExtent * 0.84;
    final pengaduanScroll = controller.position.maxScrollExtent;

    if (controller.offset == aboutScroll &&
        controller.offset < pelayananScroll) {
      setState(() {
        index = 0;
      });
    }
    if (controller.offset > pelayananScroll &&
        controller.offset < artikelScroll) {
      setState(() {
        index = 1;
      });
    }
    if (controller.offset > artikelScroll &&
        controller.offset < pengaduanScroll) {
      setState(() {
        index = 2;
      });
    }
    if (controller.offset == pengaduanScroll) {
      setState(() {
        index = 3;
      });
    }
  }

  @override
  void initState() {
    controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(_listener);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget TentangKami() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tentang Kami",
              style: ThemeText.heading2,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/carousel_1.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Sejarah UPT Puskesmas Guntur Garut",
              style: ThemeText.heading2,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Puskesmas Guntur merupakan salah satu Puskesmas di Dinas Kesehatan Kabupaten Garut yang terletak ± 2 KM, dari Pusat kotaGarut, tepatnya di Kelurahan Kota wetan.',
                    style: ThemeText.heading3
                        .copyWith(color: ColorManager.blackTextColor),
                  ),
                  TextSpan(
                    text: ' Selengkapnya...',
                    style: ThemeText.heading3
                        .copyWith(color: ColorManager.secondaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          Navigator.pushNamed(context, Routes.tentangkamiRoute),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        );

    Widget Pelayanan() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PELAYANAN",
                  style: ThemeText.heading2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.pelayananRoute);
                  },
                  child: Text(
                    "Lebih Banyak",
                    style: ThemeText.heading3
                        .copyWith(color: ColorManager.secondaryColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CustomPelayananWidget(
                imageUrl: "assets/icons/icon_persalinan.png",
                title: "Persalinan",
                day: "Senin - Jumat",
                hours: "24 Jam"),
            SizedBox(
              height: height * 0.02,
            ),
            const CustomPelayananWidget(
                imageUrl: "assets/icons/icon_poliumum.png",
                title: "Poli Umum",
                day: "Senin - Jumat",
                hours: "08.00 - 14.00"),
            SizedBox(
              height: height * 0.02,
            ),
            const CustomPelayananWidget(
                imageUrl: "assets/icons/icon_pemeriksaan.png",
                title: "Pemeriksaan Jiwa",
                day: "Senin - Jumat",
                hours: "08.00 - 14.00"),
          ],
        );

    Widget Artikel() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ARTIKEL",
                  style: ThemeText.heading2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.articleRoute);
                  },
                  child: Text("Lebih Banyak",
                      style: ThemeText.heading3
                          .copyWith(color: ColorManager.secondaryColor)),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.72,
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
                  if (state is ArticleSuccess) {
                    var items = state.okContentArticle!.article;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ArticleCard(
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailArticlePage(
                                                  title: items![index]
                                                      .header
                                                      .toString(),
                                                  imageUrl: items[index]
                                                      .imageUrl
                                                      .toString(),
                                                  puskesmas: "Puskesmas Guntur",
                                                  date: items[index]
                                                      .date
                                                      .toString(),
                                                  time:
                                                      items[index]
                                                          .time
                                                          .toString(),
                                                  textContent: items[index]
                                                      .description
                                                      .toString())));
                                },
                                imageUrl: items![index].imageUrl.toString(),
                                title: items[index].header.toString(),
                                activity: items[index].category.toString(),
                                date: items[index].date.toString()),
                          );
                        }));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        );

    return Scaffold(
      key: _key,
      drawer: const NavBar(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu_rounded,
                              color: ColorManager.secondaryColor,
                              size: height * 0.06,
                            ),
                          ),
                          Text(
                            "UPT\nPuskesmas Guntur",
                            style: ThemeText.heading2
                                .copyWith(color: ColorManager.secondaryColor),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.search,
                            size: height * 0.06,
                            color: ColorManager.secondaryColor,
                          )
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              BlocBuilder<CarouselBloc, CarouselState>(
                builder: (context, state) {
                  if (state is CarouselLoaded) {
                    var items = state.okContentCarousel.carousel;
                    return SizedBox(
                        height: height * 0.27,
                        child: CarouselSlider.builder(
                          itemCount: items!.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  pageViewIndex) =>
                              Container(
                            height: height * 0.25,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        items[itemIndex].imageUrl.toString()),
                                    fit: BoxFit.cover)),
                          ),
                          options: CarouselOptions(
                              aspectRatio: 2.0,
                              viewportFraction: 1,
                              pauseAutoPlayOnManualNavigate: true,
                              autoPlay: true,
                              scrollDirection: Axis.horizontal),
                        ));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MENU UTAMA",
                      style: ThemeText.heading2,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonNav(
                            imageUrl: "assets/images/icon_about.png",
                            title: "Tentang\nKami",
                            color: (index == 0)
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackprimaryColor,
                            press: () {
                              controller.animateTo(
                                  controller.position.minScrollExtent,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            backgroundColor: (index == 0)
                                ? ColorManager.primaryColor
                                : ColorManager.secondaryColor.withOpacity(0.2)),
                        CustomButtonNav(
                            imageUrl: "assets/images/icon_service.png",
                            title: "Pelayanan",
                            color: (index == 1)
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackprimaryColor,
                            press: () {
                              controller.animateTo(
                                  controller.position.maxScrollExtent * 0.5,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            backgroundColor: (index == 1)
                                ? ColorManager.primaryColor
                                : ColorManager.secondaryColor.withOpacity(0.2)),
                        CustomButtonNav(
                          imageUrl: "assets/images/icon_artikel.png",
                          title: "Artikel",
                          color: (index == 2)
                              ? ColorManager.whiteTextColor
                              : ColorManager.blackTextColor,
                          press: () {
                            controller.animateTo(
                                controller.position.maxScrollExtent * 0.84,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn);
                          },
                          backgroundColor: (index == 2)
                              ? ColorManager.primaryColor
                              : ColorManager.secondaryColor.withOpacity(0.2),
                        ),
                        CustomButtonNav(
                          imageUrl: "assets/images/icon_pengaduan.png",
                          title: "Pengaduan",
                          color: (index == 3)
                              ? ColorManager.whiteTextColor
                              : ColorManager.blackprimaryColor,
                          press: () {
                            Navigator.pushNamed(context, Routes.pengaduanRoute);
                            controller.animateTo(
                                controller.position.maxScrollExtent,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn);
                          },
                          backgroundColor: (index == 3)
                              ? ColorManager.primaryColor
                              : ColorManager.secondaryColor.withOpacity(0.2),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      height: height * 0.6,
                      child: NotificationListener(
                        child: ListView(
                          controller: controller,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            TentangKami(),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Pelayanan(),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Artikel(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
