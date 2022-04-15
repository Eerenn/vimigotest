import 'package:flutter/material.dart';
import 'package:vimigotest/screen/overview_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * 0.1,
                  vertical: deviceSize.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: deviceSize.width * 0.03),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontSize: 18, color: Colors.blue.shade800),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, OverviewScreen.routeName);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomLeft: Radius.circular(18.0)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.blue.shade800),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: deviceSize.width * 0.1),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, OverviewScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
