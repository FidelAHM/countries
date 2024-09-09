import 'package:countries/features/countries/presentation/pages/country_detail.dart';
import 'package:countries/features/countries/presentation/pages/country_list_two.dart';
import 'package:countries/features/splash_screen/presentation/pages/intro_screen.dart';
import 'package:countries/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String countryListTwo = '/country_list_Two';
  static const String countryDetail = '/country_detail';
  static const String introScreen = '/intro_screen';
  

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    countryListTwo: (context) =>  CountryListTwo(),
    countryDetail : (context) =>  CountryDetail(),
    introScreen : (context) =>  IntroScreen()
  };
}
