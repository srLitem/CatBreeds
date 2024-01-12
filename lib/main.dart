import 'package:catbreeds/models/cat_breed.dart';
import 'package:catbreeds/settings/custom_theme.dart';
import 'package:catbreeds/ui/pages/details/cat_breed_details_page.dart';
import 'package:catbreeds/ui/pages/landing/landing_page.dart';
import 'package:catbreeds/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: CustomTheme.customTheme,
      home: const SplashScreen(),
      routes: {
        '/landing': (context) => const LandingPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final catBreed = settings.arguments as CatBreed;
          return MaterialPageRoute(
            builder: (context) => CatBreedDetailPage(catBreed: catBreed),
          );
        }
        return null;
      },
    );
  }
}
