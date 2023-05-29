import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Menu',
              style: kPoppinsRegular.copyWith(
                fontSize: 42,
                color: kLightBlack,
              ),
            ),
            const CircleAvatar(
              backgroundColor: kDarkPurple,
              radius: 28,
              backgroundImage: AssetImage(
                'assets/images/jungle.jfif',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
