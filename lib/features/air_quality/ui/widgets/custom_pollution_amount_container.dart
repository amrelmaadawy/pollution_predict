import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/state_container.dart';

class CutsomPollutionAmoutContainer extends StatelessWidget {
  const CutsomPollutionAmoutContainer({
    super.key,
    required this.pollutionType,
    required this.pollutionAmount,
    required this.icon,
    required this.state,
    required this.textColor,
    required this.highlightColor,
  });
  final String pollutionType;
  final String pollutionAmount;
  final IconData icon;
  final String state;
  final Color textColor;
  final Color highlightColor;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        border: Border.all(color:isDark?kDarkBorderColor: kLightBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color:isDark?kDarkSubTextColor: kSubTextColor),
                SizedBox(width: 5),
                Text(pollutionType, style: TextStyle(color:isDark?kDarkSubTextColor: kSubTextColor)),
              ],
            ),
            Text(
              pollutionAmount,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            StateContainer(
              state: state,
              textColor: textColor,
              highlightColor: highlightColor,
            ),
          ],
        ),
      ),
    );
  }
}
