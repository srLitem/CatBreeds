import 'dart:io';
import 'package:catbreeds/models/cat_breed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreButton extends StatelessWidget {
  final CatBreed catBreed;

  const MoreButton({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Platform.isIOS
        ? CupertinoButton(
            child: Text("${l10n.more}...",
                style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () => _goToDetailsPage(context),
          )
        : TextButton(
            child: Text("${l10n.more}...",
                style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () => _goToDetailsPage(context),
          );
  }

  void _goToDetailsPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: catBreed,
    );
  }
}
