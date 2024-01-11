import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/ui/pages/landing/cat_breed_card.dart';
import 'package:catbreeds/ui/pages/landing/landing_page.dart';
import 'package:flutter/material.dart';

class CatBreedsList extends StatelessWidget {
  const CatBreedsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CatBreed> catBreeds = [
      CatBreed(name: 'Breed 1', country: 'Country 1', intelligence: 'High'),
      CatBreed(name: 'Breed 2', country: 'Country 2', intelligence: 'Medium'),
    ];

    return ListView.builder(
      itemCount: catBreeds.length,
      itemBuilder: (context, index) {
        return CatBreedCard(catBreed: catBreeds[index]);
      },
    );
  }
}
