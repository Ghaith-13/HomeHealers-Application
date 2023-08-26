import 'package:flutter/material.dart';
import 'package:homehealers/OnboardingScreens/firstScreen.dart';
import 'package:homehealers/OnboardingScreens/secondScreen.dart';
import 'package:homehealers/OnboardingScreens/thirdScreen.dart';

class onboardingPage extends StatelessWidget {
  final List<dynamic> pages = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return pages[index];
      },
    ));
  }
}
