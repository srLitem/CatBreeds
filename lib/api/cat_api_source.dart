import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/cat_breed.dart';

//* This fille will be calling the url of the API

class CatApiSource {
  static const String _baseUrl = 'https://api.thecatapi.com/v1/breeds';

  Future<List<CatBreed>> getBreeds() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        //* Dotenv for security :)
        'x-api-key': dotenv.env['CAT_API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> catBreedsJson = jsonDecode(response.body) as List;
      return catBreedsJson.map((json) => CatBreed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}
