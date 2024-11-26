import 'dart:convert';

import 'package:countries/core/navigator_key.dart';
import 'package:countries/core/widget/dialog/custom_snack_bar.dart';
import 'package:countries/features/countries/data/Model/Country_list_model.dart';
import 'package:countries/features/countries/data/Model/blog_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CountriesAPI {
  String? baseUrl = dotenv.env['BASE_URL'];

/////api call

  Future<List> listCountries() async {
    final url = '$baseUrl/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = jsonResponse as List;
      print('_______success');
        CustomSnackbar(navigatorKey.currentContext!)
          .showSuccessMessage('Successful');
      return result.map((e) => CountryListModel.fromJson(e)).toList();
      
    } else {
      CustomSnackbar(navigatorKey.currentContext!)
          .showErrorMessage(response.reasonPhrase.toString());
      print(response.body);
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }

  // Future<List> fetchBlog() async {
  //   final url = '$baseUrl';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final jsonResponse = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     final List<dynamic> result = jsonResponse as List<dynamic>;
  //     print('_______success');
  //       CustomSnackbar(navigatorKey.currentContext!)
  //         .showSuccessMessage('Successful');
  //     return result.map((e) => BlogModel.fromJson(e)).toList();
      
  //   } else {
  //     CustomSnackbar(navigatorKey.currentContext!)
  //         .showErrorMessage(response.reasonPhrase.toString());
  //     print(response.body);
  //     print(response.reasonPhrase);
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

 Future<List<BlogModel>> fetchBlogAsList() async {
  final url = '$baseUrl';
  final uri = Uri.parse(url);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    try {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print('_______success');
      CustomSnackbar(navigatorKey.currentContext!)
          .showSuccessMessage('Successful');
      final blog = BlogModel.fromJson(jsonResponse);
      return [blog]; // Wrap the single BlogModel in a list
    } catch (e) {
      print('Error parsing JSON: $e');
      throw Exception('Failed to parse blog data');
    }
  } else {
    CustomSnackbar(navigatorKey.currentContext!)
        .showErrorMessage(response.reasonPhrase.toString());
    print(response.body);
    print(response.reasonPhrase);
    throw Exception(response.reasonPhrase);
  }
}

}
