import 'package:countries/core/utils/textstyle.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;

  AppBarCommon({required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkGreen,
      elevation: 0,
      title:
          Text(title, style: AppTextStyle.whiteboldtxtInterSemiBold14weight700),
      leading: leading,
      centerTitle: true,

      //  IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: AppColors.yellowA700,
      //     ))
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
