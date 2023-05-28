import 'package:flutter/material.dart';

import '../animations/fade_animation_y.dart';
import '../constants/constants.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool reverseColors;
  const ActionButton({
    super.key,
    required this.onTap,
    this.reverseColors = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationY(
      delay: 1.2,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: kCircularBorderRadius25,
            color: reverseColors ? kDarkPurple : kWhite2,
          ),
          child: Text(
            'Get Started',
            style: kPoppinsSemiBold.copyWith(
              color: reverseColors ? kWhite : kDarkPurple,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
