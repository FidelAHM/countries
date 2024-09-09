
import 'package:countries/features/countries/presentation/pages/countries_list.dart';
import 'package:countries/features/countries/presentation/pages/country_detail.dart';
import 'package:countries/features/countries/presentation/pages/country_list_two.dart';
import 'package:countries/features/countries/presentation/pages/home_page.dart';
import 'package:countries/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homePage = '/home_page';
  static const String countryList = '/country_list';
  static const String countryListTwo = '/country_list_Two';
   static const String countryDetail = '/country_detail';
  

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage : (context) => const HomePage(),
    countryList: (context) =>  CountryList(),
    countryListTwo: (context) =>  CountryListTwo(),
    countryDetail : (context) =>  CountryDetail()
  };
}
