import 'package:flutter/material.dart';
import 'package:pollution/features/air_quality/ui/air_quality_view.dart';
import 'package:pollution/features/air_quality/ui/widgets/custom_nav_bar.dart';
import 'package:pollution/features/air_quality_alerts/UI/air_quality_alerts_view.dart';
import 'package:pollution/features/air_quality_map/UI/air_quality_map_view.dart';
import 'package:pollution/features/forecasts/UI/forecasts_view.dart';

import 'package:pollution/generated/l10n.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  late List<String> appBarsTitle = [
    S.of(context).airQuality,
    "Air Quality Map",
    "Forecasts",
    "Air Quality Status",
  ];
  List<Widget> pages = [
    AirQualitiyView(),
    AirQualityMapView(),
    ForecastsView(),
    AirQualityAlertsView(),
  ];
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
        title: Text(
          appBarsTitle[currentIndex],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: pages[currentIndex],
    );
  }
}
