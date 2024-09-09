class CountryListModel {
  final String common;
  final String official;
  final String region;
  final String flags;
  final List<dynamic> capital;
  final int population;
  final Map<String,dynamic> currencies;
  final Map<String,dynamic> language;
   final List<dynamic> borders;

  CountryListModel({
    required this.capital,
    required this.common,
    required this.region,
    required this.flags,
    required this.official,
    required this.population,
    required this.currencies,
    required this.language,
    required this.borders
 
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    
    return CountryListModel(
        capital:
            json['capital'] != null ? List<String>.from(json['capital']) : [],
        common: json['name']['common'] ?? "no data",
        flags: json['flags']['png'] ?? "no data",
        population: json['population'] ?? 0,
        official: json['name']['official'] ?? "no data",
        region: json['region'] ?? "no data", 
        currencies:  json['currencies'] ?? {},
        language: json['languages'] ?? {},
        borders: json['borders'] != null
          ? List<String>.from(json['borders'])
          : [], 
    
        );
  }
}
