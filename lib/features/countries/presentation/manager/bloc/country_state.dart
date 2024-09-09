part of 'country_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

class CountryDataLoadingState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryDataLoadedState extends CountryState {
  final List<CountryListModel> countries;

  CountryDataLoadedState(this.countries);
}

class CountryDataError extends CountryState {
  final String error;
  CountryDataError(this.error);
     @override
  List<Object> get props => [error];

}
