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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
