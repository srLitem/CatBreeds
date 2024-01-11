import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/ui/pages/landing/cat_breed_card.dart';
import 'package:flutter/material.dart';

class CatBreedsList extends StatelessWidget {
  const CatBreedsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CatBreed> catBreeds = [
      CatBreed(
          id: "test1",
          name: 'Breed 1',
          description: "Description 1",
          temperament: "Temperament 1",
          origin: 'Country 1',
          intelligence: 'High',
          referenceImageId: "https://placekitten.com/200/200"),
      CatBreed(
          id: "test2",
          name: 'Breed 2',
          description: "Description 2",
          temperament: "Temperament 2",
          origin: 'Country 2',
          intelligence: 'Medium',
          referenceImageId: "https://placekitten.com/200/200"),
      CatBreed(
          id: "test3",
          name: 'Breed 3',
          description: "Description 3",
          temperament: "Temperament 3",
          origin: 'Country 3',
          intelligence: 'Low',
          referenceImageId: "https://placekitten.com/200/200"),
    ];

    return ListView.builder(
      itemCount: catBreeds.length,
      itemBuilder: (context, index) {
        return CatBreedCard(catBreed: catBreeds[index]);
      },
    );
  }
}
