import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/custom_pollution_amount_container.dart';
import 'package:pollution/features/air_quality/ui/widgets/linear_chart.dart';
import 'package:pollution/features/air_quality/ui/widgets/weather_conditions_containers.dart';
import 'package:pollution/generated/l10n.dart';

class AirQualitiyView extends StatelessWidget {
  const AirQualitiyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                  textColor: isDark
                      ? kDarkTextGreenColor
                      : klightGreenTextColor,
                  highlightColor: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                ),
                Spacer(),
                CutsomPollutionAmoutContainer(
                  pollutionType: 'NO2',
                  pollutionAmount: '20 ppb',
                  icon: Icons.air,
                  state: S.of(context).moderate,
                  textColor: isDark ? kDarkYellowTextColor : kYellowTextColor,
                  highlightColor: isDark
                      ? kDarkHighlightYellowColor
                      : kLightHighlightYellowColor,
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
                  textColor: isDark ? kDarkRedTextColor : kRedTextColor,
                  highlightColor: isDark
                      ? kDarkHighlightRedColor
                      : kLightHighlightRedColor,
                ),
                Spacer(),
                CutsomPollutionAmoutContainer(
                  pollutionType: 'SO2',
                  pollutionAmount: '5 ppb',
                  icon: Icons.cloud_outlined,
                  state: S.of(context).unhealthy,
                  textColor: isDark ? kDarkRedTextColor : kRedTextColor,
                  highlightColor: isDark
                      ? kDarkHighlightRedColor
                      : kLightHighlightRedColor,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).hourForecast,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark ? kDarkBorderColor : kLightBorderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).aqiTrend,
                      style: TextStyle(
                        color: isDark ? kDarkSubTextColor : kSubTextColor,
                        fontSize: 17,
                      ),
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
            SizedBox(height: 10),
            Text(
              S.of(context).WeatherConditions,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherConditionsContainers(
                  weatherCondition: S.of(context).Temperature,
                  weatherValue: '25°C',
                  icon: Icons.thermostat_outlined,
                ),
                WeatherConditionsContainers(
                  weatherCondition: S.of(context).Wind,
                  weatherValue: '15 km/h',
                  icon: Icons.air_outlined,
                ),
                WeatherConditionsContainers(
                  weatherCondition: S.of(context).Humidity,
                  weatherValue: '60%',
                  icon: Icons.water_drop_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
