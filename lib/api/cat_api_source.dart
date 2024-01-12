import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/cat_breed.dart';

//* This fille will be calling the url of the API

class CatApiSource {
  static const String _baseUrl = 'https://api.thecatapi.com/v1/breeds';
  static const String _imageUrlBase = 'https://api.thecatapi.com/v1/images/';

  Future<List<CatBreed>> getBreeds() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'x-api-key': dotenv.env['CAT_API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> catBreedsJson = jsonDecode(response.body) as List;
      var breedsWithImages = await Future.wait(catBreedsJson.map((json) async {
        var breed = CatBreed.fromJson(json);
        var imageUrl = await _fetchBreedImageUrl(breed.referenceImageId);
        return breed.copyWith(actualURL: imageUrl);
      }));
      return breedsWithImages;
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }

  Future<String> _fetchBreedImageUrl(String referenceImageId) async {
    final response = await http.get(
      Uri.parse('$_imageUrlBase$referenceImageId'),
      headers: {
        'x-api-key': dotenv.env['CAT_API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      var imageData = jsonDecode(response.body);

      return imageData['url'];
    } else {
      return '';
    }
  }
}
