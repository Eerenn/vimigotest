import 'package:flutter/material.dart';
import 'package:vimigotest/screen/user_guideline/page1.dart';
import 'package:vimigotest/screen/user_guideline/page2.dart';
import 'package:vimigotest/screen/user_guideline/page3.dart';
import 'package:vimigotest/screen/user_guideline/page4.dart';
import 'package:vimigotest/screen/user_guideline/page5.dart';
import 'package:vimigotest/screen/user_guideline/page6.dart';
import 'package:vimigotest/screen/user_guideline/page7.dart';

class UserGuidelineScreen extends StatefulWidget {
  const UserGuidelineScreen({Key? key}) : super(key: key);
  static const routeName = '/user_guideline';

  @override
  State<UserGuidelineScreen> createState() => _UserGuidelineScreenState();
}

class _UserGuidelineScreenState extends State<UserGuidelineScreen> {
  final _pageController = PageController(
    initialPage: 0,
  );
  static const totalIndex = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20,
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0,
      ),
      body: Ink(
        color: Theme.of(context).colorScheme.onBackground,
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            children: const [
              Page1(
                index: 0,
                totalIndex: totalIndex,
              ),
              Page2(
                index: 1,
                totalIndex: totalIndex,
              ),
              Page3(
                index: 2,
                totalIndex: totalIndex,
              ),
              Page4(
                index: 3,
                totalIndex: totalIndex,
              ),
              Page5(
                index: 4,
                totalIndex: totalIndex,
              ),
              Page6(
                index: 5,
                totalIndex: totalIndex,
              ),
              Page7(
                index: 6,
                totalIndex: totalIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
