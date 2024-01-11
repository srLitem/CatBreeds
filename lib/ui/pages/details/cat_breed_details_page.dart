import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/material.dart';

class CatBreedDetailPage extends StatelessWidget {
  final CatBreed catBreed;

  const CatBreedDetailPage({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(catBreed.name),
              background: Image.network(
                catBreed.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildDetailSection(context, 'Country', catBreed.country),
                _buildDetailSection(
                    context, 'Intelligence', catBreed.intelligence),
                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context, String title, String value) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(value, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
