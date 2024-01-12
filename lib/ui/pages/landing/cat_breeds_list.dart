import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/ui/pages/landing/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/providers/cat_breed_provider.dart';

// * This widget has the whole list of cats from the landing page
class CatBreedsList extends ConsumerWidget {
  const CatBreedsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<CatBreed>> catBreeds = ref.watch(catBreedProvider);

    return catBreeds.when(
      data: (List<CatBreed> breeds) {
        return ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (context, index) {
            return CatBreedCard(catBreed: breeds[index]);
          },
        );
      },
      //* We don´t want an error when loading the data :)
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
