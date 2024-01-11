import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
            child: Image.network(
              catBreed.imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildDetailSection(context, l10n.country, catBreed.country),
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
}
