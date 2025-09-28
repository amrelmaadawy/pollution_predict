import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality_alerts/UI/widgets/alert_list_view.dart';
import 'package:pollution/features/air_quality_alerts/UI/widgets/current_aqi_card.dart';
import 'package:pollution/generated/l10n.dart';

class AirQualityAlertsView extends StatelessWidget {
  const AirQualityAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CurrentAQICard(),

          Row(
            children: [
              Text(
                S.of(context).Alerts,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                child: Text(
                  S.of(context).ViewAll,
                  style: TextStyle(
                    color: isDark ? kDarkTextGreenColor : klightGreenTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          AlertsListView(),
        ],
      ),
    );
  }
}
