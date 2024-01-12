import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';

class IOSLandingPage extends ConsumerStatefulWidget {
  const IOSLandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IOSLandingPage> createState() => _IOSLandingPageState();
}

class _IOSLandingPageState extends ConsumerState<IOSLandingPage> {
  String searchQuery = '';

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Catbreeds'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.search),
          onPressed: () => showCupertinoSearch(context),
        ),
      ),
      child: CatBreedsList(searchQuery: searchQuery),
    );
  }

  void showCupertinoSearch(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Search'), //TODO Localize
          content: CupertinoSearchTextField(
            onChanged: updateSearchQuery,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'), //TODO Localize
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
