import 'package:catbreeds/ui/pages/landing/cat_breeds_list.dart';
import 'package:flutter/material.dart';

//* Landing page for android
class AndroidLandingPage extends StatelessWidget {
  const AndroidLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showMaterialSearch(context);
            },
          ),
        ],
      ),
      body: const CatBreedsList(),
    );
  }

  void showMaterialSearch(BuildContext context) {
    // TODO: Inneeed to mplement Material search functionality
  }
}
