import 'package:countries/core/routes.dart';
import 'package:countries/core/utils/image_constant.dart';
import 'package:countries/core/utils/textstyle.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Country App",
            body: "See All The Countries In The World",
            image: buildImage(AppImages.world1),
            decoration: getPageDecoration()),
        PageViewModel(
            title: "Country App",
            body: "Know about World Population",
            image: buildImage(AppImages.population),
            decoration: getPageDecoration()),
        PageViewModel(
            title: "Country App",
            body: "Capital Cities and More ...",
            image: buildImage(AppImages.capital),
            decoration: getPageDecoration()),
      ],
      done: InkWell(
        child: Text("Get Started",
            style: AppTextStyle.txtInterSemiBold12DarkGreen),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.countryListTwo);
        },
      ),
      onDone: () {},
      next: Icon(Icons.arrow_forward, color: AppColors.darkGreen),
      showNextButton: true,
      showBackButton: false,
      showSkipButton: true,
      dotsDecorator: getDotDecoration(),
      onChange: (index) {
        print('page$index selected');
      },
      skip: Text("Skip", style: AppTextStyle.txtInterSemiBold12DarkGreen),
    ));
  }

  Widget buildImage(String Path) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
      child: Center(
        child: Image.asset(
          Path,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: AppTextStyle.txtInterSemiBold25DarkGreen,
        imagePadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        pageColor: AppColors.whiteA700,
      );

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: AppColors.gray100,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        activeColor: AppColors.darkGreen);
  }
}
