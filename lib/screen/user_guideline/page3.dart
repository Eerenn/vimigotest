import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({
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
            'assets/images/ss_sort_asc.png',
            height: deviceSize.height * 0.3,
          ),
        ),
        SizedBox(
          width: deviceSize.width * 0.76,
          child: const Text(
            'To sort the list, you may tap the icon at top right hand corner, then select your sorting option.\nBy default is sort by date in ascending.',
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
