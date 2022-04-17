import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({
    Key? key,
    required this.index,
    required this.totalIndex,
  }) : super(key: key);

  final double index;
  final int totalIndex;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Image.asset(
            'assets/images/ss_add_contact.png',
            height: deviceSize.height * 0.3,
          ),
        ),
        SizedBox(
          width: deviceSize.width * 0.76,
          child: const Text(
            'To add a new staff, you may tap on "Add new staff" from the more button, then input new contact name and number on the given field and tap "Create".\n New staff will be added into the list.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              height: 1.6,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: deviceSize.height * 0.08),
          child: DotsIndicator(
            dotsCount: totalIndex,
            position: index,
          ),
        ),
      ],
    );
  }
}
