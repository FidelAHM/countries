import 'package:bloc/bloc.dart';
import 'package:countries/core/navigator_key.dart';
import 'package:countries/core/widget/dialog/custom_snack_bar.dart';
import 'package:countries/features/countries/data/Model/Country_list_model.dart';
import 'package:countries/features/countries/data/data_source/country_api.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<LoadCountriesEvent>((event, emit) async {
      emit(CountryDataLoadingState());
      try {
        final countries = await CountriesAPI().listCountries();
        emit(CountryDataLoadedState(countries as List<CountryListModel>));
      } catch (e) {
        print('________Error${e}');
        CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage(e.toString());
        emit(CountryDataError('an error has occured'));
      }
    });
  }
}
