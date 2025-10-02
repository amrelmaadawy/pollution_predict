class CityPollutionModel {
  String? city;
  double? lat;
  double? lng;
  double? pm10;
  double? no2;
  double? so2;
  double? co;
  double? o3;
  double? temp;
  double? wind;
  double? humidity;

  CityPollutionModel({
    this.city,
    this.lat,
    this.lng,
    this.pm10,
    this.no2,
    this.so2,
    this.co,
    this.o3,
    this.temp,
    this.wind,
    this.humidity,
  });

  factory CityPollutionModel.fromJson(Map<String, dynamic> json) {
    return CityPollutionModel(
      city: json['city'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
      no2: (json['no2'] as num?)?.toDouble(),
      so2: (json['so2'] as num?)?.toDouble(),
      co: (json['co'] as num?)?.toDouble(),
      o3: (json['o3'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
      wind: (json['wind'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'city': city,
    'lat': lat,
    'lng': lng,
    'pm10': pm10,
    'no2': no2,
    'so2': so2,
    'co': co,
    'o3': o3,
    'temp': temp,
    'wind': wind,
    'humidity': humidity,
  };
}
