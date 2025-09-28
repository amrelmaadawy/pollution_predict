import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AirQualityMapView extends StatelessWidget {
  AirQualityMapView({super.key});

  // بيانات تلوث (Hardcoded)
  final List<Map<String, dynamic>> pollutionData = [
    {
      "location": LatLng(30.0444, 31.2357), // القاهرة
      "level": "High",
    },
    {
      "location": LatLng(29.9668, 32.5498), // السويس
      "level": "Medium",
    },
    {
      "location": LatLng(31.2001, 29.9187), // الإسكندرية
      "level": "Low",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(30.0444, 31.2357),
        initialZoom: 6.5,
      ),
      children: [
        TileLayer(
          urlTemplate: isDark
              ? "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png"
              : "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: "com.example.pollution_map",
        ),
        CircleLayer(
          circles: pollutionData.map((point) {
            double radius;
            Color color;

            switch (point["level"]) {
              case "High":
                radius = 50000000;
                color = Colors.red.withValues(alpha:0.4);
                break;
              case "Medium":
                radius = 30000000;
                color = Colors.orange.withValues(alpha:0.4);
                break;
              default:
                radius = 20000000;
                color = Colors.green.withValues(alpha:0.4);
            }

            return CircleMarker(
              point: point["location"],
              radius: radius / 1000,
              useRadiusInMeter: true,
              color: color,
              borderStrokeWidth: 2,
              borderColor: Colors.red.shade900,
            );
          }).toList(),
        ),
      ],
    );
  }
}
