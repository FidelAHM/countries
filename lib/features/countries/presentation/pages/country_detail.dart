import 'package:countries/core/utils/theme.dart';
import 'package:countries/core/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatefulWidget {
  const CountryDetail({super.key});

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: 'Country Detail', 
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.whiteA700),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ),
    );
  }
}
