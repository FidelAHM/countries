import 'package:countries/core/utils/image_constant.dart';
import 'package:countries/core/utils/padding.dart';
import 'package:countries/core/utils/sizedbox.dart';
import 'package:countries/core/utils/textstyle.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:countries/features/countries/data/Model/Country_list_model.dart';
import 'package:countries/features/countries/presentation/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetail extends StatefulWidget {
  const CountryDetail({super.key});

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as CountryListModel; ////countries from previous screen
    String languageName = ''; /////language 
    if (item.language.isNotEmpty) {
      String languageCode = item.language.keys.first;
      languageName = item.language[languageCode] ?? 'Unknown language';
    } else {
      languageName = 'No languages available.';
    }
    String bordersString = item.borders.join(', '); ////borders
    print(item.borders);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: XPadding.onlyTop10,
                  child: Center(
                      child: Image.network(
                    item.flags,
                    height: 200.h,
                    width: 300.w,
                  )),
                ),
                Padding(
                  padding: XPadding.allTopAndLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.darkGreen,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: XPadding.allSidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.official,
                    style: AppTextStyle.txtInterSemiBold25DarkGreen,
                  ),
                  XGapHeight.h10,
                  Divider(color: AppColors.lightBlue100, thickness: 1),
                  Content(
                      title: 'Capital',
                      image: AppImages.capital,
                      text: Text(
                        item.capital[0],
                        style: AppTextStyle.txtPoppinsRegular12Black900,
                      )),
                  XGapHeight.h10,
                  Content(
                      title: 'Population',
                      image: AppImages.population,
                      text: Text(
                        item.population.toString(),
                        style: AppTextStyle.txtPoppinsRegular12Black900,
                      )),
                  XGapHeight.h10,
                  Content(
                      title: 'Language',
                      image: AppImages.language,
                      text: Text(
                        languageName,
                        style: AppTextStyle.txtPoppinsRegular12Black900,
                      )),
                  XGapHeight.h10,
                  Content(
                      image: AppImages.border,
                      text: Text(
                          bordersString.isEmpty ? "No borders" : bordersString),
                      title: 'Borders'),
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.currencies.length,
                        itemBuilder: (context, index) {
                          String currencyCode =
                              item.currencies.keys.elementAt(index);
                          Map<String, dynamic> currencyDetails =
                              item.currencies[currencyCode];
                          String currencyName =
                              currencyDetails['name'] ?? 'Unknown';
                          String currencySymbol =
                              currencyDetails['symbol'] ?? 'Unknown';
                          return Content(
                              image: AppImages.money,
                              text: RichText(
                                text: TextSpan(
                                    text: currencyName, ////currency name
                                    style: AppTextStyle
                                        .txtPoppinsRegular12Black900,
                                    children: [
                                      TextSpan(
                                          text: "   ${currencySymbol}", /////currency symbol
                                          style: AppTextStyle
                                              .txtInterRegular12DarkGreen)
                                    ]),
                              ),
                              title: 'Currency');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
