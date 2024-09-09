import 'package:countries/core/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Content extends StatelessWidget {
  final String image;
  final String title;
  final Widget  text;

  const Content(
      {required this.image, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          image,
          height: 20.h,
          width: 20.h,
        ),
        title: Text(
          title,
          style: AppTextStyle.txtInterSemiBold14DarkGreen,
        ),
        subtitle: text
        );
  }
}
