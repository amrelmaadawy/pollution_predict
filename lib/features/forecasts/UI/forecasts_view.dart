import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/linear_chart.dart';
import 'package:pollution/features/forecasts/UI/widgets/custom_forecasts_time_container.dart';
import 'package:pollution/features/forecasts/UI/widgets/todays_forecast_by_time.dart';

class ForecastsView extends StatelessWidget {
  const ForecastsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Air Quality Index(AQI) Forecast",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomForecastsTimeContianer(time: 'Today'),
              SizedBox(width: 10),
              CustomForecastsTimeContianer(time: 'Tomorrow'),
              SizedBox(width: 10),
              CustomForecastsTimeContianer(time: 'Next 7 Days'),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kLightBorderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [TodaysForecastsByTime(), LinearChart()]),
            ),
          ),
        ],
      ),
    );
  }
}
