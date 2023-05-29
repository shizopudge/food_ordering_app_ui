import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';
import '../data/models/additive.dart';

class AdditiveCard extends StatelessWidget {
  final Additive additive;
  const AdditiveCard({
    super.key,
    required this.additive,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: .25,
      child: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: SizedBox(
          width: 90,
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: kCircularBorderRadius20,
                  color: kLightGrey,
                ),
                child: Image.asset(
                  additive.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.add_circle,
                    size: 28,
                    color: kGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
