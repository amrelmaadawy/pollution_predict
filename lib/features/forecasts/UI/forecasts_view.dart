import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/linear_chart.dart';
import 'package:pollution/features/forecasts/UI/widgets/custom_forecasts_time_container.dart';
import 'package:pollution/features/forecasts/UI/widgets/custom_pollutant_details_container.dart';
import 'package:pollution/features/forecasts/UI/widgets/todays_forecast_by_time.dart';
import 'package:pollution/generated/l10n.dart';

class ForecastsView extends StatefulWidget {
  const ForecastsView({super.key});

  @override
  State<ForecastsView> createState() => _ForecastsViewState();
}

class _ForecastsViewState extends State<ForecastsView> {
  String selectedTime = 'Today';
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
              S.of(context).AirQualityIndexAQIForecast,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = 'Today';
                    });
                  },
                  child: CustomForecastsTimeContianer(
                    time: S.of(context).Today,
                    isSelected: selectedTime == 'Today',
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = 'Next 7 Days';
                    });
                  },
                  child: CustomForecastsTimeContianer(
                    time: S.of(context).Next7Days,
                    isSelected: selectedTime == 'Next 7 Days',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDark ? kDarkBorderColor : kLightBorderColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [TodaysForecastsByTime(), LinearChart()],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).PollutantDetails,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPollutantDetailsContainer(
                  pollutantName: 'Ozone',
                  pollutantValue: '45',
                ),
                CustomPollutantDetailsContainer(
                  pollutantName: 'PM2.5',
                  pollutantValue: '60',
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomPollutantDetailsContainer(
              pollutantName: 'NO2',
              pollutantValue: '20',
            ),
          ],
        ),
      ),
    );
  }
}
