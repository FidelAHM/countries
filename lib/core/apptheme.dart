import 'package:countries/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AppTheme {
  static _border([Color color = Colors.grey]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 2
      )
      );

  static final appBackgroundTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.whiteA700,
    
      );

}
