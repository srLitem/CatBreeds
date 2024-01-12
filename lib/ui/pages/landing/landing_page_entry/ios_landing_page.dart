import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';
import 'package:catbreeds/ui/pages/landing/search_delegate.dart';
import 'package:catbreeds/providers/cat_breed_provider.dart';
import 'package:catbreeds/providers/search_provider.dart';
import 'package:flutter/material.dart';

class IOSLandingPage extends ConsumerStatefulWidget {
  const IOSLandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IOSLandingPage> createState() => _IOSLandingPageState();
}

class _IOSLandingPageState extends ConsumerState<IOSLandingPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Catbreeds'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {
            showCupertinoSearch(context, ref);
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              ),
            ),
            Expanded(
              child: CatBreedsList(
                searchQuery: searchQuery,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCupertinoSearch(BuildContext context, WidgetRef ref) {
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
