import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';
import 'package:catbreeds/ui/pages/landing/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/providers/cat_breed_provider.dart';

//* Landing page for android
class AndroidLandingPage extends ConsumerWidget {
  const AndroidLandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showMaterialSearch(context, ref);
            },
          ),
        ],
      ),
      body: const CatBreedsList(),
    );
  }

  void showMaterialSearch(BuildContext context, WidgetRef ref) {
    ref.read(catBreedProvider.future).then((catBreeds) {
      showSearch(
        context: context,
        delegate: CatBreedSearchDelegate(catBreeds),
      );
    });
  }
}
