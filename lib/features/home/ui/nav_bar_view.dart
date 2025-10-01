import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/history/ui/history_view.dart';
import 'package:pollution/features/home/ui/custom_nav_bar.dart';
import 'package:pollution/features/air_quality_map/UI/air_quality_map_view.dart';
import 'package:pollution/features/home/ui/home.dart';
import 'package:pollution/features/predict/ui/predict_view.dart';
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
    'History',
    S.of(context).Setting,
  ];
  List<Widget> pages = [
    Home(),
    AirQualityMapView(),
    HistoryView(),
    SettingView(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PredictView()),
          );
        },
        backgroundColor: isDark
            ? kDarkHighlightGreenColor
            : kLightHighlightGreenColor,
        child: Icon(Icons.add, color: isDark ? Colors.white : Colors.black),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onTabChange: (int p1) {
          setState(() {
            currentIndex = p1;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
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
