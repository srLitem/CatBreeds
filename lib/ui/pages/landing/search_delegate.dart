import 'package:catbreeds/ui/pages/landing/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/models/cat_breed.dart';

//* This file contains the delegate that will help filtering
class CatBreedSearchDelegate extends SearchDelegate {
  final List<CatBreed> catBreeds;

  CatBreedSearchDelegate(this.catBreeds);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CatBreed> filteredBreeds = catBreeds
        .where(
            (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredBreeds.length,
      itemBuilder: (context, index) {
        return CatBreedCard(catBreed: filteredBreeds[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CatBreed> filteredBreeds = catBreeds
        .where(
            (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredBreeds.length,
      itemBuilder: (context, index) {
        return CatBreedCard(catBreed: filteredBreeds[index]);
      },
    );
  }
}
