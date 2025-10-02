import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pollution/features/predict/logic/cubit/predict_cubit.dart';

Future<List<dynamic>> loadPollutionData() async {
    final String response = await rootBundle.loadString(
      'lib/features/air_quality_map/Logic/pollution_data.json',
    );
    return json.decode(response);
  }

  void searchCity(BuildContext context, String cityName,MapController mapController,List<dynamic>pollutionData) {
    if (cityName.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter a city name")));
      return;
    }

    final city = pollutionData.firstWhere(
      (element) =>
          element["city"].toString().toLowerCase() == cityName.toLowerCase(),
      orElse: () => null,
    );

    if (city == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("City not found")));
      return;
    }

    final lat = city["lat"];
    final lng = city["lng"];

    mapController.move(LatLng(lat!, lng!), 10);

    context.read<PredictCubit>().predictCityAQI(city: city);
  }
