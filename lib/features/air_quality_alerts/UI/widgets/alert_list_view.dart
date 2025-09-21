
import 'package:flutter/material.dart';
import 'package:pollution/features/air_quality_alerts/UI/widgets/custom_alert_container.dart';

class AlertsListView extends StatelessWidget {
  const AlertsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CustomAlertContainer();
        },
        itemCount: 10,
      ),
    );
  }
}
