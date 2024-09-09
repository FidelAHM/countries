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

class CountryList extends StatefulWidget {
  CountryList({super.key});
  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List<CountryListModel> itemList = [];
  List<CountryListModel> _searchedItem = [];
  List items = [];
  @override
  void initState() {
    super.initState();
    final countriesBloc = BlocProvider.of<CountryBloc>(context);
    countriesBloc.add(LoadCountriesEvent());
    print(countriesBloc.state);
    final state = countriesBloc.state;
    // final countriesListLength = state.props[0];

    if (state is CountryDataLoadedState) {
      print('helllllllllllllllllllllll');
      final countriesList = state.countries;
      setState(() {
        itemList = countriesList;
      });
    }
    // countriesBloc.stream.listen((state) {
    //   if (state is CountryDataLoadedState) {
    //     setState(() {
    //       itemList = state.countries;
    //       _searchedItem = List.from(itemList); // Make a copy for filtering
    //     });
    //   }
    // });
     _searchedItem = List.from(itemList);
    isNumberEntered = false;
    quantityController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      isNumberEntered = quantityController.text.isNotEmpty;
    });
  }

  List<Map<String, dynamic>> _selectedItems = [];
  void _runFilter(String enteredKeyword) {
    List<CountryListModel> searchResults = [];
    if (enteredKeyword.isEmpty) {
      searchResults = List.from(_searchedItem);
    } else {
      searchResults = _searchedItem
          .where((item) => item.common
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      itemList = searchResults.cast<CountryListModel>();
    });
  }

  TextEditingController quantityController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool isNumberEntered = false;

  @override
  void dispose() {
    quantityController.dispose();
    quantityController.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Countries List',
          leading: Icon(
            Icons.home,
            color: AppColors.whiteA700,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding,
          child: Column(
            children: [
              Search(
                onChanged: (value) {
                  _runFilter(value);
                },
                edit: quantityController,
              ),
              XGapHeight.h20,
              BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryDataLoadedState) {
                    print(state.countries);
                    return itemList.isEmpty
                        ? Center(
                            child: Text('No Data'),
                          )
                        : Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final item = itemList[index];
                                  return Padding(
                                      padding: XPadding.onlyBottom10,
                                      child: ListTile(
                                        title: Text(item.common),
                                      ));
                                },
                                itemCount: itemList.length,
                                scrollDirection: Axis.vertical,
                                padding: XPadding.onlyBottom10,
                              ),
                            ],
                          );
                  } else {
                    return Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.lightBlue100,
                        child: Container(
                          height: 70.h,
                          width: 300.w,
                          color: AppColors.lightBlue,
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
