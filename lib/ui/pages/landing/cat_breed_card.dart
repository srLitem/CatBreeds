import 'package:catbreeds/ui/generic/more_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreed catBreed;

  const CatBreedCard({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Card(
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: <Widget>[
            _buildTitleRow(l10n, textStyle),
            const SizedBox(
              height: 10.0,
            ),
            _buildCatImage(),
            const SizedBox(
              height: 10.0,
            ),
            _buildDetailsRow(),
          ],
        ),
      ),
    );
  }

  Row _buildTitleRow(AppLocalizations l10n, TextStyle? textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            catBreed.name,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(child: MoreButton(l10n: l10n)),
      ],
    );
  }

  Widget _buildCatImage() {
    //TODO: I have to replace with actual image URL from the APi from Pragma
    const imageUrl = 'https://placekitten.com/200/200';
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }

  Row _buildDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            catBreed.country,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          child: Text(
            catBreed.intelligence,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
