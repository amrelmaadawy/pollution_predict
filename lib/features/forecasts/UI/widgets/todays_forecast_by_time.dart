
import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class TodaysForecastsByTime extends StatelessWidget {
  const TodaysForecastsByTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 70,
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
                  backgroundColor: kLightPrimaryColor,
                  child: Text(
                    '50', // القيمة
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 3),
        itemCount: 12,
      ),
    );
  }
}
