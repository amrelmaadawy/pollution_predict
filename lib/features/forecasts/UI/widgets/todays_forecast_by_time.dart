import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class TodaysForecastsByTime extends StatelessWidget {
  const TodaysForecastsByTime({super.key});

  @override
  Widget build(BuildContext context) {
     final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${index + 1} PM', // الوقت
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: isDark?kDarkPrimaryColor: kLightPrimaryColor,
                  child: Text(
                    '50', // القيمة
                    style:  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color:isDark?Colors.white: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
