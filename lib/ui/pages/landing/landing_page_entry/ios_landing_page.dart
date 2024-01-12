import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//* Landing page for iOS
class IOSLandingPage extends StatelessWidget {
  const IOSLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Catbreeds'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {
            showCupertinoSearch(context);
          },
        ),
      ),
      child: const CatBreedsList(),
    );
  }

  void showCupertinoSearch(BuildContext context) {
    // TODO: I need to Implement Cupertino search functionality
  }
}
