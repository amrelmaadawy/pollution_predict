import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/state_container.dart';
import 'package:pollution/features/air_quality_alerts/UI/custom_alert_container.dart';

class AirQualityAlertsView extends StatelessWidget {
  const AirQualityAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Current AQI',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      StateContainer(
                        state: 'Good',
                        textColor: kLightPrimaryColor,
                        highlightColor: kLightHighlightGreenColor,
                      ),
                    ],
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => SweepGradient(
                      colors: const [Colors.green, Colors.yellow, Colors.green],
                      startAngle: 0.0,
                      endAngle: 6.28, // 2π علشان يلف الدائرة كلها
                    ).createShader(bounds),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color:
                              Colors.white, // Placeholder (هيتغير بالـ Shader)
                          width: 6,
                        ),
                      ),
                      alignment: AlignmentGeometry.center,
                      child: Text(
                        '55',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your Current Air Quality Index (AQI) is 55, which is considered 'Good'. Enjoy your day!",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Text(
                'Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: kLightHighlightGreenColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: kLightPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomAlertContainer();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
