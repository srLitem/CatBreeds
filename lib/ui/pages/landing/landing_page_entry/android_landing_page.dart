import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/providers/cat_breed_provider.dart';
import 'package:catbreeds/providers/search_provider.dart';
import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';
import 'package:catbreeds/ui/pages/landing/search_delegate.dart';

class AndroidLandingPage extends ConsumerStatefulWidget {
  const AndroidLandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AndroidLandingPage> createState() => _AndroidLandingPageState();
}

class _AndroidLandingPageState extends ConsumerState<AndroidLandingPage> {
  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showMaterialSearch(context, ref),
          ),
        ],
      ),
      body: CatBreedsList(searchQuery: searchQuery),
    );
  }

  void showMaterialSearch(BuildContext context, WidgetRef ref) {
    ref.read(catBreedProvider.future).then((catBreeds) {
      showSearch(
        context: context,
        delegate: CatBreedSearchDelegate(catBreeds),
      ).then((result) {
        if (result != null) {
          ref.read(searchQueryProvider.notifier).state = result;
        }
      });
    });
  }
}
