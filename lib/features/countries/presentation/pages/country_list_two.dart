import 'package:countries/core/routes.dart';
import 'package:countries/core/utils/padding.dart';
import 'package:countries/core/utils/sizedbox.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:countries/core/widget/appbar/custom_appbar.dart';
import 'package:countries/features/countries/data/Model/Country_list_model.dart';
import 'package:countries/features/countries/presentation/manager/bloc/country_bloc.dart';
import 'package:countries/features/countries/presentation/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CountryListTwo extends StatefulWidget {
  const CountryListTwo({super.key});

  @override
  State<CountryListTwo> createState() => _CountryListTwoState();
}

class _CountryListTwoState extends State<CountryListTwo> {
  List<CountryListModel> _filteredCountries = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(LoadCountriesEvent());

    _searchController.addListener(() {
      _runFilter(_searchController.text);
    });
  }

  void _runFilter(String enteredKeyword) {
    final countriesBloc = context.read<CountryBloc>();
    if (countriesBloc.state is CountryDataLoadedState) {
      final state = countriesBloc.state as CountryDataLoadedState;
      setState(() {
        if (enteredKeyword.isEmpty) {
          _filteredCountries = state.countries;
        } else {
          _filteredCountries = state.countries
              .where((country) => country.common
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
              .toList();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Countries',
          leading: IconButton(
            icon: Icon(Icons.home, color: AppColors.whiteA700),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding5,
          child: Column(
            children: [
              Padding(
                padding: XPadding.allSidePadding,
                child: Search(
                    onChanged: (value) {
                      _runFilter(value);
                    },
                    edit: _searchController),
              ),
              BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryDataLoadedState) {
                    final countriesToDisplay = _filteredCountries.isNotEmpty
                        ? _filteredCountries
                        : state.countries;

                    return Column(
                      children: [
                        XGapHeight.h10,
                        Container(
                          height: 600.h,
                          child: ListView.builder(
                            itemCount: countriesToDisplay.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final countries = countriesToDisplay[index];

                              return Padding(
                                padding: XPadding.allSidePadding5,
                                child: Card(
                                  color: AppColors.gray50,
                                  elevation: 0,
                                  child: ListTile(
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //     context, AppRoutes.favouriteProduct,
                                      //     arguments: products);
                                    },
                                    leading: Image.network(
                                        height: 50.h,
                                        width: 50.w,
                                        countries.flags),
                                    title: Text(countries.common),
                                    subtitle: Text(countries.region),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            padding: XPadding.onlyBottom10,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: AppColors.lightBlue100,
                      child: Padding(
                        padding: XPadding.allSidePadding,
                        child: Container(
                          height: 50.h,
                          width: 300.w,
                          color: AppColors.lightBlue,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
