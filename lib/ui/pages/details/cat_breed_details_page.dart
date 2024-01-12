import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//* This is the Page used to show all the data of one cat
class CatBreedDetailPage extends StatelessWidget {
  final CatBreed catBreed;

  const CatBreedDetailPage({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(catBreed.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
              child: _buildCatImage()),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildDetailSection(context, l10n.name, catBreed.name),
                  _buildDetailSection(context, l10n.country, catBreed.origin),
                  _buildDetailSection(
                      context, l10n.description, catBreed.description),
                  _buildDetailSection(
                      context, l10n.temperament, catBreed.temperament),
                  _buildDetailSection(
                      context, l10n.intelligence, catBreed.intelligence),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context, String title, String value) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.displayMedium),
      subtitle: Text(value, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _buildCatImage() {
    if (catBreed.actualURL != null && catBreed.actualURL!.isNotEmpty) {
      return Image.network(
        catBreed.actualURL!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/image_not_found.png');
        },
      );
    } else {
      return Image.asset('assets/image_not_found.png');
    }
  }
}
