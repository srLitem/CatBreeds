import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/cat_breed.dart';

final catBreedProvider = FutureProvider<List<CatBreed>>((ref) async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/breeds'),
    headers: {
      'x-api-key': dotenv.env['CAT_API_KEY']!,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> catBreedsJson = jsonDecode(response.body) as List;
    return catBreedsJson.map((json) => CatBreed.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load cat breeds');
  }
});
