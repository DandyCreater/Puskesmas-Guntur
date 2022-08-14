import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puskesmas_guntur/presentation/pages/homepage/homepage.dart';
import 'package:puskesmas_guntur/presentation/pages/jadwal/jadwal_dokter_page.dart';
import 'package:puskesmas_guntur/presentation/pages/profile/profile_page.dart';
import 'package:puskesmas_guntur/presentation/resources/color_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  var pages = [
    const HomePage(),
    const JadwalDokterPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          fixedColor: ColorManager.primaryColor,
          onTap: (value) => setState(() => _currentIndex = value),
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: ColorManager.primaryColor,
                  size: 20,
                ),
                icon: Icon(
                  Icons.home,
                  color: ColorManager.secondaryColor,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.calendar_month,
                  color: ColorManager.primaryColor,
                  size: 20,
                ),
                icon: Icon(
                  Icons.calendar_month,
                  color: ColorManager.secondaryColor,
                ),
                label: "Jadwal Dokter"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: ColorManager.primaryColor,
                  size: 20,
                ),
                icon: Icon(
                  Icons.person,
                  color: ColorManager.secondaryColor,
                ),
                label: "Profile"),
          ]),
    );
  }
}
