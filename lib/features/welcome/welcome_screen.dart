import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../animations/fade_animation_y.dart';
import '../../app.dart';
import '../../common/action_button.dart';
import '../../constants/constants.dart';
import 'widgets/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _onTap(BuildContext context) => Navigator.push(
        context,
        PageTransition(
          curve: Curves.easeOut,
          duration: const Duration(
            milliseconds: 250,
          ),
          type: PageTransitionType.size,
          child: const Hub(),
          alignment: Alignment.bottomCenter,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              kDarkPurple,
              kLightPurple,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const WelcomeImage(
                image: 'assets/images/welcome_salad.png',
              ),
              const SizedBox(
                height: 54,
              ),
              FadeAnimationY(
                delay: 1.1,
                child: Text(
                  'Enjoy\nYour Food',
                  textAlign: TextAlign.center,
                  style: kPoppinsRegular.copyWith(fontSize: 42),
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              ActionButton(
                onTap: () => _onTap(context),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
