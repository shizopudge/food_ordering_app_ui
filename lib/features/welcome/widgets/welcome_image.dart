import 'package:flutter/material.dart';

import '../../../animations/fade_animation_y.dart';

class WelcomeImage extends StatelessWidget {
  final String image;
  const WelcomeImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeAnimationY(
        delay: 1.0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 42),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
