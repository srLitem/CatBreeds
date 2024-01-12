import '../api/cat_api_source.dart';
import '../models/cat_breed.dart';

//* This file will be used to manager the data that came from the API

class CatBreedService {
  final CatApiSource catApiSource;

  CatBreedService(this.catApiSource);

  Future<List<CatBreed>> getCatBreeds() async {
    return catApiSource.getBreeds();
  }
}
