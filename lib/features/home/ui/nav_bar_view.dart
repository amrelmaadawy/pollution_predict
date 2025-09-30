import 'package:flutter/material.dart';
import 'package:pollution/features/home/ui/custom_nav_bar.dart';
import 'package:pollution/features/air_quality_map/UI/air_quality_map_view.dart';
import 'package:pollution/features/home/ui/home.dart';
import 'package:pollution/features/setting/UI/setting_view.dart';

import 'package:pollution/generated/l10n.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  late List<String> appBarsTitle = [
    S.of(context).airQuality,
    S.of(context).AirQualityMap,

    S.of(context).Setting,
  ];
  List<Widget> pages = [Home(), AirQualityMapView(), SettingView()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onTabChange: (int p1) {
          setState(() {
            currentIndex = p1;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor, // يخليها زي الخلفية
        surfaceTintColor: Colors.transparent, // يمنع الـ overlay
        elevation: 0, // يمنع الظل
        title: Text(
          appBarsTitle[currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: pages[currentIndex],
    );
  }
}
