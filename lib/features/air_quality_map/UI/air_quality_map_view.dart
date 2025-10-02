import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pollution/features/air_quality_map/Logic/get_city_aqi.dart';
import 'package:pollution/features/air_quality_map/UI/widgets/present_city_aqi.dart';
import 'package:pollution/features/predict/ui/widgets/custom_text_form_field.dart';

class AirQualityMapView extends StatefulWidget {
  const AirQualityMapView({super.key});

  @override
  State<AirQualityMapView> createState() => _AirQualityMapViewState();
}

class _AirQualityMapViewState extends State<AirQualityMapView> {
  List<dynamic> pollutionData = [];
  final TextEditingController searchController = TextEditingController();
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    loadPollutionData().then((data) {
      setState(() {
        pollutionData = data;
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
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
          ],
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CustomTextFormField(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                searchCity(context, searchController.text,_mapController,pollutionData);
                FocusScope.of(context).unfocus();
                searchController.clear();
              },
            ),
            controller: searchController,
            text: '',
            labelText: 'Search City',
            validator: (p) {
              return null;
            },
            keyboardType: TextInputType.text,
          ),
        ),

        PresentCityAQI(),
      ],
    );
  }

  
}
