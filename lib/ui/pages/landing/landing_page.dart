import 'dart:io';
import 'package:catbreeds/ui/pages/landing/landing_page_entry/android_landing_page.dart';
import 'package:catbreeds/ui/pages/landing/landing_page_entry/ios_landing_page.dart';
import 'package:flutter/cupertino.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IOSLandingPage() : const AndroidLandingPage();
  }
}
