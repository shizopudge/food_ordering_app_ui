import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';
import '../data/models/product.dart';
import '../menu_screen.dart';
import 'product_card.dart';

class Popular extends StatelessWidget {
  const Popular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimationX(
          delay: 1.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              'Popular',
              style: kPoppinsRegular.copyWith(
                fontSize: 24,
                color: kLightBlack,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        FadeAnimationX(
          delay: 1.3,
          child: SizedBox(
            height: 214,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 28),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final Product product = products[index];
                return ProductCard(
                  product: product,
                  id: index + 551,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
