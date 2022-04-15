import 'package:flutter/material.dart';
import 'package:vimigotest/screen/onboarding_screen.dart';
import 'package:vimigotest/screen/overview_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vimigo Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
      routes: {
        OverviewScreen.routeName: (ctx) => const OverviewScreen(),
        OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
      },
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}
