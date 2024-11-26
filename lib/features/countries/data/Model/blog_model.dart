class BlogModel {
  final String name;
  final String description;
  final String url;
  final String home;
  BlogModel({required this.description, required this.name, required this.url, required this.home});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      description: json['description'] ?? "no data",
      name: json['name'] ?? "no data",
      url: json['url'] ?? "no data",
      home: json['home'] ?? "no data"
    );
  }
}
