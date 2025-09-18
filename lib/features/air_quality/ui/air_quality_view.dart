import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/custom_pollution_amount_container.dart';
import 'package:pollution/features/air_quality/ui/widgets/linear_chart.dart';
import 'package:pollution/generated/l10n.dart';

class AirQualityView extends StatelessWidget {
  const AirQualityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).airQuality,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).keyIndicator,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CutsomPollutionAmoutContainer(
                    pollutionType: 'PM2.5',
                    pollutionAmount: '15 µg/m³',
                    icon: Icons.air,
                    state: S.of(context).good,
                    textColor: kLightPrimaryColor,
                    highlightColor: kLightHighlightGreenColor,
                  ),
                  Spacer(),
                  CutsomPollutionAmoutContainer(
                    pollutionType: 'NO2',
                    pollutionAmount: '20 ppb',
                    icon: Icons.air,
                    state: S.of(context).moderate,
                    textColor: kYellowTextColor,
                    highlightColor: kLightHighlightYellowColor,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CutsomPollutionAmoutContainer(
                    pollutionType: 'Ozone ',
                    pollutionAmount: '45 ppb',
                    icon: Icons.wb_sunny_outlined,
                    state: S.of(context).unhealthy,
                    textColor: kRedTextColor,
                    highlightColor: kLightHighlightRedColor,
                  ),
                  Spacer(),
                  CutsomPollutionAmoutContainer(
                    pollutionType: 'SO2',
                    pollutionAmount: '5 ppb',
                    icon: Icons.cloud_outlined,
                    state: S.of(context).unhealthy,
                    textColor: kRedTextColor,
                    highlightColor: kLightHighlightRedColor,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '24-hour Forecast',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kLightBorderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AQI Trend ",
                        style: TextStyle(color: kSubTextColor, fontSize: 17),
                      ),
                      Text(
                        "60",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LinearChart(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
