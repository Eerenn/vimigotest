import 'package:flutter/material.dart';
import 'package:vimigotest/screen/add_contact_screen.dart';
import 'package:vimigotest/screen/onboarding_screen.dart';
import 'package:vimigotest/screen/overview_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vimigotest/screen/user_guideline_screen.dart';

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
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
      routes: {
        OverviewScreen.routeName: (ctx) => const OverviewScreen(),
        OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
        AddContactScreen.routeName: (ctx) => AddContactScreen(),
        UserGuidelineScreen.routeName: (ctx) => const UserGuidelineScreen(),
      },
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}
