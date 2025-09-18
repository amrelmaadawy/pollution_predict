import 'package:flutter/material.dart';
import 'package:pollution/generated/l10n.dart';

class AirQualityView extends StatelessWidget {
  const AirQualityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(title: Text(S.of(context).airQuality),),
    );
  }
}