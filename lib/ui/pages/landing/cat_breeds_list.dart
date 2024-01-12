import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/ui/pages/landing/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/providers/cat_breed_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// * This widget has the whole list of cats from the landing page

class CatBreedsList extends ConsumerWidget {
  final String searchQuery;

  const CatBreedsList({Key? key, this.searchQuery = ''}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<CatBreed>> catBreeds = ref.watch(catBreedProvider);
    final l10n = AppLocalizations.of(context)!;

    return catBreeds.when(
      data: (List<CatBreed> breeds) {
        List<CatBreed> filteredBreeds = searchQuery.isEmpty
            ? breeds
            : breeds
                .where((breed) => breed.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
                .toList();
        if (filteredBreeds.isEmpty && searchQuery.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/empty_state.png',
                  scale: 2.5,
                ),
                const SizedBox(height: 16),
                Text(
                  '${l10n.noResults} "$searchQuery"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: filteredBreeds.length,
          itemBuilder: (context, index) {
            return CatBreedCard(catBreed: filteredBreeds[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
