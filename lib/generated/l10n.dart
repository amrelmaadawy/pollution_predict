// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Air Quality`
  String get airQuality {
    return Intl.message('Air Quality', name: 'airQuality', desc: '', args: []);
  }

  /// `Good`
  String get good {
    return Intl.message('Good', name: 'good', desc: '', args: []);
  }

  /// `Moderate`
  String get moderate {
    return Intl.message('Moderate', name: 'moderate', desc: '', args: []);
  }

  /// `Unhealthy`
  String get unhealthy {
    return Intl.message('Unhealthy', name: 'unhealthy', desc: '', args: []);
  }

  /// `Key Indicator`
  String get keyIndicator {
    return Intl.message(
      'Key Indicator',
      name: 'keyIndicator',
      desc: '',
      args: [],
    );
  }

  /// `24-hour Forecast`
  String get hourForecast {
    return Intl.message(
      '24-hour Forecast',
      name: 'hourForecast',
      desc: '',
      args: [],
    );
  }

  /// `AQI Trend`
  String get aqiTrend {
    return Intl.message('AQI Trend', name: 'aqiTrend', desc: '', args: []);
  }

  /// `Weather Conditions`
  String get WeatherConditions {
    return Intl.message(
      'Weather Conditions',
      name: 'WeatherConditions',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get Temperature {
    return Intl.message('Temperature', name: 'Temperature', desc: '', args: []);
  }

  /// `Wind`
  String get Wind {
    return Intl.message('Wind', name: 'Wind', desc: '', args: []);
  }

  /// `Humidity`
  String get Humidity {
    return Intl.message('Humidity', name: 'Humidity', desc: '', args: []);
  }

  /// `Air Quality Index(AQI) Forecast`
  String get AirQualityIndexAQIForecast {
    return Intl.message(
      'Air Quality Index(AQI) Forecast',
      name: 'AirQualityIndexAQIForecast',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message('Today', name: 'Today', desc: '', args: []);
  }

  /// `Next 7 Days`
  String get Next7Days {
    return Intl.message('Next 7 Days', name: 'Next7Days', desc: '', args: []);
  }

  /// `Pollutant Details`
  String get PollutantDetails {
    return Intl.message(
      'Pollutant Details',
      name: 'PollutantDetails',
      desc: '',
      args: [],
    );
  }

  /// `Alerts`
  String get Alerts {
    return Intl.message('Alerts', name: 'Alerts', desc: '', args: []);
  }

  /// `View All`
  String get ViewAll {
    return Intl.message('View All', name: 'ViewAll', desc: '', args: []);
  }

  /// `Current AQI`
  String get CurrentAQI {
    return Intl.message('Current AQI', name: 'CurrentAQI', desc: '', args: []);
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message('Dark Mode', name: 'DarkMode', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Air Quality Map`
  String get AirQualityMap {
    return Intl.message(
      'Air Quality Map',
      name: 'AirQualityMap',
      desc: '',
      args: [],
    );
  }

  /// `forecast`
  String get forecast {
    return Intl.message('forecast', name: 'forecast', desc: '', args: []);
  }

  /// `Air Quality Status`
  String get AirQualityStatus {
    return Intl.message(
      'Air Quality Status',
      name: 'AirQualityStatus',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Setting {
    return Intl.message('Settings', name: 'Setting', desc: '', args: []);
  }

  /// `Dashboard`
  String get Dashboard {
    return Intl.message('Dashboard', name: 'Dashboard', desc: '', args: []);
  }

  /// `Map`
  String get Map {
    return Intl.message('Map', name: 'Map', desc: '', args: []);
  }

  /// `Unhealthy (Sensitive Groups)`
  String get UnhealthySensitiveGroups {
    return Intl.message(
      'Unhealthy (Sensitive Groups)',
      name: 'UnhealthySensitiveGroups',
      desc: '',
      args: [],
    );
  }

  /// `Very Unhealthy`
  String get VeryUnhealthy {
    return Intl.message(
      'Very Unhealthy',
      name: 'VeryUnhealthy',
      desc: '',
      args: [],
    );
  }

  /// `Hazardous`
  String get Hazardous {
    return Intl.message('Hazardous', name: 'Hazardous', desc: '', args: []);
  }

  /// `AM`
  String get AM {
    return Intl.message('AM', name: 'AM', desc: '', args: []);
  }

  /// `PM`
  String get PM {
    return Intl.message('PM', name: 'PM', desc: '', args: []);
  }

  /// `No predictions saved yet.`
  String get Nopredictionssavedyet {
    return Intl.message(
      'No predictions saved yet.',
      name: 'Nopredictionssavedyet',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `History`
  String get History {
    return Intl.message('History', name: 'History', desc: '', args: []);
  }

  /// `No Prediction Yet`
  String get NoPredictionYet {
    return Intl.message(
      'No Prediction Yet',
      name: 'NoPredictionYet',
      desc: '',
      args: [],
    );
  }

  /// `Last Prediction`
  String get LastPrediction {
    return Intl.message(
      'Last Prediction',
      name: 'LastPrediction',
      desc: '',
      args: [],
    );
  }

  /// `Predicted AQI`
  String get PredictedAQI {
    return Intl.message(
      'Predicted AQI',
      name: 'PredictedAQI',
      desc: '',
      args: [],
    );
  }

  /// `Health Tips`
  String get HealthTips {
    return Intl.message('Health Tips', name: 'HealthTips', desc: '', args: []);
  }

  /// `Stay indoors and avoid outdoor activities`
  String get Stayindoorsandavoidoutdooractivities {
    return Intl.message(
      'Stay indoors and avoid outdoor activities',
      name: 'Stayindoorsandavoidoutdooractivities',
      desc: '',
      args: [],
    );
  }

  /// `Enter Air Quality Data`
  String get EnterAirQuailtyData {
    return Intl.message(
      'Enter Air Quality Data',
      name: 'EnterAirQuailtyData',
      desc: '',
      args: [],
    );
  }

  /// `This Field is Required`
  String get ThisFieldisRequired {
    return Intl.message(
      'This Field is Required',
      name: 'ThisFieldisRequired',
      desc: '',
      args: [],
    );
  }

  /// `Predict Air Quality Index`
  String get PredictAirQualityIndex {
    return Intl.message(
      'Predict Air Quality Index',
      name: 'PredictAirQualityIndex',
      desc: '',
      args: [],
    );
  }

  /// `Predict`
  String get Predict {
    return Intl.message('Predict', name: 'Predict', desc: '', args: []);
  }

  /// `search City`
  String get searchCity {
    return Intl.message('search City', name: 'searchCity', desc: '', args: []);
  }

  /// `Calculating AQI...`
  String get CalculatingAQI {
    return Intl.message(
      'Calculating AQI...',
      name: 'CalculatingAQI',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message('Status', name: 'Status', desc: '', args: []);
  }

  /// `Error`
  String get Error {
    return Intl.message('Error', name: 'Error', desc: '', args: []);
  }

  /// `Please Enter City Name`
  String get PleaseEnterCityName {
    return Intl.message(
      'Please Enter City Name',
      name: 'PleaseEnterCityName',
      desc: '',
      args: [],
    );
  }

  /// `City not found`
  String get Citynotfound {
    return Intl.message(
      'City not found',
      name: 'Citynotfound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
