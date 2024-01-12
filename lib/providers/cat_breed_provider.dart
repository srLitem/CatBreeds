import 'package:catbreeds/api/cat_api_source.dart';
import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/cat_breed_service.dart';

//* This file will define the providers that will be connsudmed by the UI

final catApiSourceProvider = Provider<CatApiSource>((ref) {
  return CatApiSource();
});

final catBreedServiceProvider = Provider<CatBreedService>((ref) {
  return CatBreedService(ref.read(catApiSourceProvider));
});

final catBreedProvider = FutureProvider<List<CatBreed>>((ref) {
  final service = ref.read(catBreedServiceProvider);
  return service.getCatBreeds();
});
