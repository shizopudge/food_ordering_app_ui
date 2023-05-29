import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class Promotions extends StatelessWidget {
  const Promotions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              'Promotions',
              style: kPoppinsRegular.copyWith(
                fontSize: 24,
                color: kLightBlack,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 24,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                borderRadius: kCircularBorderRadius20,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    kLighterPurple,
                    kLightererPurple,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          text: TextSpan(
                            text: 'Today\'s Offer\n',
                            style: kPoppinsRegular.copyWith(
                              fontSize: 16,
                              color: kWhite2,
                            ),
                            children: [
                              TextSpan(
                                text: 'Free box of Fries\n',
                                style: kPoppinsSemiBold.copyWith(
                                  fontSize: 20,
                                  color: kWhite2,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'on all orders above \$150',
                                    style: kPoppinsRegular.copyWith(
                                      fontSize: 16,
                                      color: kWhite2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 107,
                    width: 107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        17,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/fries.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
