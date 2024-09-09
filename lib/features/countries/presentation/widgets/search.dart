import 'package:countries/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController edit;

  const Search({required this.onChanged, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: double.infinity,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.yellowA700,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.yellow100),
          ),
          hintText: 'search',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlue900),
          ),
        ),
      ),
    );
  }
}
