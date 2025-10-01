String getHealthTip(double prediction) {
  if (prediction <= 50) {
    return "The air quality is good . Enjoy your outdoor activities.";
  } else if (prediction <= 100) {
    return "Air quality is moderate . Sensitive individuals should reduce prolonged outdoor exertion.";
  } else if (prediction <= 150) {
    return " Unhealthy for sensitive groups. Consider limiting outdoor activities if you have asthma or heart conditions.";
  } else if (prediction <= 200) {
    return " Unhealthy. Everyone should limit prolonged outdoor exertion.";
  } else if (prediction <= 300) {
    return " Very Unhealthy. Stay indoors and avoid any outdoor activities.";
  } else {
    return " Hazardous. Remain indoors with windows closed and avoid all physical activities.";
  }
}
