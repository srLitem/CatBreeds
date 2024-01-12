import 'package:catbreeds/ui/generic/more_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/material.dart';

//* As required, we use a card to show the cat preview data

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
            _buildDetailsRow(l10n),
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
        Flexible(child: MoreButton(catBreed: catBreed)),
      ],
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

  Row _buildDetailsRow(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            catBreed.origin,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          child: Text(
            l10n.intelligence,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
