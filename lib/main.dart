import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/settings/custom_theme.dart';
import 'package:catbreeds/ui/pages/details/cat_breed_details_page.dart';
import 'package:catbreeds/ui/pages/landing/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatBreeds',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //* Supporting english and spanish in Catbreeds
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: CustomTheme.customTheme,
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const LandingPage(), // Keep the Landing Page route here
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final catBreed = settings.arguments as CatBreed;
          return MaterialPageRoute(
            builder: (context) {
              return CatBreedDetailPage(catBreed: catBreed);
            },
          );
        }
        return null;
      },
    );
  }
}
