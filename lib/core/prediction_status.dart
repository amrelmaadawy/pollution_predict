import 'package:flutter/material.dart';

Widget getPredictionStatus(double prediction) {
  if (prediction <= 50) {
    return Text(
      "Good",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  } else if (prediction <= 100) {
    return Text(
      "Moderate",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    );
  } else if (prediction <= 150) {
    return Text(
      "Unhealthy (Sensitive Groups)",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.yellow.shade800,
      ),
    );
  } else if (prediction <= 200) {
    return Text(
      "Unhealthy",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  } else if (prediction <= 300) {
    return Text(
      "Very Unhealthy",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  } else {
    return Text(
      "Hazardous",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.brown,
      ),
    );
  }
}
