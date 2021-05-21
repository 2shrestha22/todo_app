import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/constants.dart';

class OnboardingPage extends StatelessWidget {
  final listPagesViewModel = [
    PageViewModel(
      title: "Manage",
      decoration: const PageDecoration(
        pageColor: primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 26,
        ),
        bodyTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body:
          "Manage the progress of the task completion Track the time and analyze",
      image: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(
              "assets/todo.png",
              height: 800,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () {
        //set flag false to not display intro screen again in next launch
        Hive.box(introBox).put(introBox, false);
        Navigator.pushReplacementNamed(context, '/');
      },
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 18,
        ),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 18,
        ),
      ),
      done: const Text(
        "Lets go",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.orange,
          fontSize: 18,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.orange,
        color: primaryColor,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
