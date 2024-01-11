import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreButton extends StatelessWidget {
  final AppLocalizations l10n;

  const MoreButton({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text("${l10n.more}...",
                style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () {
              //TODO: Function to go to detailsPage
            },
          )
        : TextButton(
            child: Text("${l10n.more}...",
                style: Theme.of(context).textTheme.bodyMedium),
            onPressed: () {
              //TODO: Function to go to detailsPage
            },
          );
  }
}
