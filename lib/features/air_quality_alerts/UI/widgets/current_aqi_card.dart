import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/state_container.dart';
import 'package:pollution/generated/l10n.dart';

class CurrentAQICard extends StatelessWidget {
  const CurrentAQICard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context).CurrentAQI,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                StateContainer(
                  state: S.of(context).good,
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
                    color: Colors.white, // Placeholder (هيتغير بالـ Shader)
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
    );
  }
}
