// ignore_for_file: unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:puskesmas_guntur/presentation/bloc/article-Bloc/article_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/carousel-Bloc/carousel_bloc.dart';
import 'package:puskesmas_guntur/presentation/bloc/hospital-Bloc/hospital_bloc.dart';
import 'package:puskesmas_guntur/presentation/pages/article/detail-article-page.dart';
import 'package:puskesmas_guntur/presentation/pages/hospital/hospital_page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/font_manager.dart';
import 'package:puskesmas_guntur/presentation/resources/routes_manager.dart';
import 'package:puskesmas_guntur/presentation/widget/at_article-Page/article_card.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/customButtonNav.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/customPelayanan.dart';
import 'package:puskesmas_guntur/presentation/widget/at_home-Page/navBar.dart';
import 'package:puskesmas_guntur/presentation/widget/at_hospital-Page/custom_hospital_card_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // ScrollController controller = ScrollController(initialScrollOffset: 0);
  AutoScrollController controller = AutoScrollController();
  // double scrollController = 0.0;
  bool search = false;
  bool tap = false;
  var index = 0;

  _searchFunction() {
    setState(() {
      search = !search;
      tap = !tap;
    });
    print(tap);
  }

  @override
  void initState() {
    _searchFunction();

    // controller.addListener(_listener());

    // controller.addListener(_listener);
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    // _tapFunction();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.removeListener(_listener);
    // controller.dispose();
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

    Widget Hospital() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rujukan",
                  style: ThemeText.heading2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.hospitalRoute);
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
            SizedBox(
              height: height * 0.5,
              child: BlocBuilder<HospitalBloc, HospitalState>(
                builder: (context, state) {
                  if (state is HospitalLoaded) {
                    var items = state.okContentHospital!.hospital;
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: ((context, index) {
                        return CustomHospitalCardWidget(
                            press: () {},
                            imageUrl: items![index].imageUrl.toString(),
                            title: items[index].title.toString(),
                            location: items[index].address.toString(),
                            number: items[index].noTelp.toString());
                      }),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
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
              height: height * 0.47,
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

    Widget pengaduan() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PENGADUAN",
                  style: ThemeText.heading2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.articleRoute);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.pengaduanRoute);
                    },
                    child: Text("Lebih Banyak",
                        style: ThemeText.heading3
                            .copyWith(color: ColorManager.secondaryColor)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: double.infinity,
              height: height * 0.33,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pengaduan_img.png"),
                      fit: BoxFit.cover)),
            )
          ],
        );

    Widget kontak() => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "KONTAK",
                  style: ThemeText.heading2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.articleRoute);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.contactRoute);
                    },
                    child: Text("Lebih Banyak",
                        style: ThemeText.heading3
                            .copyWith(color: ColorManager.secondaryColor)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              height: height * 0.33,
              decoration: BoxDecoration(
                  color: ColorManager.whiteTextColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        color: ColorManager.blackprimaryColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Hubungi Kami",
                      style: ThemeText.heading2,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/icons/icon_phone.png"),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "(0262)232265",
                        style: ThemeText.heading2.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/icons/whatsapp_icon.png"),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "08211783967",
                        style: ThemeText.heading2.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/icons/icon_gmail.png"),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Puskesmasguntur24@gmail.com",
                        style: ThemeText.heading2.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/icons/icon_address.png"),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Jl. Guntur No.234, Garut Jawa Barat",
                        style: ThemeText.heading2.copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );

    Widget searchTextField() => InputHistoryTextField(
          historyKey: "01",
          // ignore: prefer_const_literals_to_create_immutables
          lockItems: ['Artikel', 'Info Aplikasi', 'Pelayanan', 'BPJS'],
          showHistoryIcon: true,
          showDeleteIcon: false,
          historyIcon: Icons.search,
          listStyle: ListStyle.List,
          listDecoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: ColorManager.searchTextFieldColor,
          ),
          decoration: InputDecoration(
              prefixIcon: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    color: ColorManager.secondaryColor,
                    size: 30,
                  ),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  _searchFunction();
                },
                child: Icon(
                  Icons.close,
                  color: ColorManager.secondaryColor,
                  size: 30,
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(5, 15, 5, 2),
              isDense: true,
              isCollapsed: true,
              fillColor: ColorManager.searchTextFieldColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                borderSide: BorderSide(color: ColorManager.blackTextColor),
              )),
        );

    List content = [
      TentangKami(),
      Pelayanan(),
      Hospital(),
      Artikel(),
      pengaduan(),
      kontak(),
    ];

    return Scaffold(
      backgroundColor: ColorManager.whiteTextColor,
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
                    (search)
                        ? Row(
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
                                  style: ThemeText.heading2.copyWith(
                                      color: ColorManager.secondaryColor),
                                  textAlign: TextAlign.center,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _searchFunction();
                                  },
                                  child: Icon(Icons.search,
                                      size: height * 0.06,
                                      color: ColorManager.secondaryColor),
                                )
                              ])
                        : searchTextField(),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<CarouselBloc, CarouselState>(
                  builder: (context, state) {
                    if (state is CarouselLoaded) {
                      var items = state.okContentCarousel.carousel;
                      return SizedBox(
                          height: height * 0.27,
                          width: width,
                          child: CarouselSlider.builder(
                            itemCount: items!.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    pageViewIndex) =>
                                Container(
                              height: height * 0.25,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          items[itemIndex].imageUrl.toString()),
                                      fit: BoxFit.cover)),
                            ),
                            options: CarouselOptions(
                                viewportFraction: 1,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                enlargeCenterPage: true,
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          CustomButtonNav(
                              imageUrl: "assets/images/icon_about.png",
                              title: "Tentang\nKami",
                              color: (index == 0)
                                  ? ColorManager.whiteTextColor
                                  : ColorManager.blackprimaryColor,
                              press: () {
                                setState(() {
                                  index = 0;
                                });
                                controller.scrollToIndex(
                                  0,
                                  duration: const Duration(seconds: 1),
                                  preferPosition: AutoScrollPosition.begin,
                                );
                              },
                              backgroundColor: (index == 0)
                                  ? ColorManager.primaryColor
                                  : ColorManager.secondaryColor
                                      .withOpacity(0.2)),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          CustomButtonNav(
                              imageUrl: "assets/images/icon_service.png",
                              title: "Pelayanan",
                              color: (index == 1)
                                  ? ColorManager.whiteTextColor
                                  : ColorManager.blackprimaryColor,
                              press: () {
                                setState(() {
                                  index = 1;
                                });
                                print(index);
                                controller.scrollToIndex(1,
                                    duration: const Duration(seconds: 1),
                                    preferPosition: AutoScrollPosition.begin);
                              },
                              backgroundColor: (index == 1)
                                  ? ColorManager.primaryColor
                                  : ColorManager.secondaryColor
                                      .withOpacity(0.2)),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          CustomButtonNav(
                              press: () {
                                setState(() {
                                  index = 2;
                                });
                                controller.scrollToIndex(
                                  2,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              imageUrl: "assets/images/icon_hospital.png",
                              title: "RS Rujukan",
                              color: (index == 2)
                                  ? ColorManager.whiteTextColor
                                  : ColorManager.blackTextColor,
                              backgroundColor: (index == 2)
                                  ? ColorManager.primaryColor
                                  : ColorManager.secondaryColor
                                      .withOpacity(0.2)),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          CustomButtonNav(
                            imageUrl: "assets/images/icon_artikel.png",
                            title: "Artikel",
                            color: (index == 3)
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackTextColor,
                            press: () {
                              setState(() {
                                index = 3;
                              });
                              controller.scrollToIndex(3,
                                  duration: const Duration(seconds: 1),
                                  preferPosition: AutoScrollPosition.begin);
                            },
                            backgroundColor: (index == 3)
                                ? ColorManager.primaryColor
                                : ColorManager.secondaryColor.withOpacity(0.2),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          CustomButtonNav(
                            imageUrl: "assets/images/icon_pengaduan.png",
                            title: "Pengaduan",
                            color: (index == 4)
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackprimaryColor,
                            press: () {
                              setState(() {
                                index = 4;
                              });
                              controller.scrollToIndex(4,
                                  duration: const Duration(seconds: 1),
                                  preferPosition: AutoScrollPosition.begin);
                            },
                            backgroundColor: (index == 4)
                                ? ColorManager.primaryColor
                                : ColorManager.secondaryColor.withOpacity(0.2),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          CustomButtonNav(
                            imageUrl: "assets/icons/icon_contacts.png",
                            title: "Kontak",
                            color: (index == 5)
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackprimaryColor,
                            press: () {
                              setState(() {
                                index = 5;
                              });
                              controller.scrollToIndex(5,
                                  duration: const Duration(seconds: 1),
                                  preferPosition: AutoScrollPosition.begin);
                            },
                            backgroundColor: (index == 5)
                                ? ColorManager.primaryColor
                                : ColorManager.secondaryColor.withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                        height: height * 0.5,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller,
                            itemCount: content.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: AutoScrollTag(
                                    key: ValueKey(index),
                                    controller: controller,
                                    child: content[index],
                                    index: index),
                              );
                            }))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
