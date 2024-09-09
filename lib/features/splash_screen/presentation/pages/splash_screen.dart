import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:countries/core/utils/image_constant.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:countries/features/countries/presentation/pages/countries_list.dart';
import 'package:countries/features/countries/presentation/pages/country_list_two.dart';
import 'package:countries/features/countries/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppImages.logo,
      nextScreen:  CountryListTwo(),
      backgroundColor: AppColors.whiteA700,
      duration: 3000,
    );
  }
}