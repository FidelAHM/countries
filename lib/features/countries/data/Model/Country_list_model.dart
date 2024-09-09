class CountryListModel {
  final String common;
  final String official;
  final String region;
  final String flags;
  // // final String region;
  // // final String capital;
  // final int population;
  // // final String borders;
  // // final String nativeCommon;
  // final String nativeOffical;

  CountryListModel({
    // required this.borders,
    // required this.capital,
    required this.common,
    required this.region,
    required this.flags,
    // required this.name,
    // required this.nativeName,
    required this.official,
    // required this.population,
    // // required this.region,
    // // required this.nativeCommon,
    // required this.nativeOffical
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    // var nativeName = json['name']['nativeName'];

    // Get the first key dynamically (assuming at least one exists)
    // String firstKey = nativeName.keys.first;
    return CountryListModel(
      // borders: json['borders'][0] ?? "no data",
      // capital: json['capital'][0] ?? "no data",
      common: json['name']['common'] ?? "no data",
      flags: json['flags']['png'] ?? "no data",
      // name: json['name'] ?? "no data",
      // nativeName: json['nativeName'] ?? "no data",
      official: json['name']['official'] ?? "no data",
      region: json['region']
      // population: json['population'] ?? 0,
      // region: json['region'] ?? "no data",
      // nativeCommon: json['nativeName']['common'] ?? "no data",
      // nativeOffical: json['name']['nativeName']['eng']['common'] ?? ""
    );
  }
}
