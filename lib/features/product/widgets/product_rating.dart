import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDarkPurple,
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: kGolden,
            size: 24,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '4.8',
            style: kPoppinsSemiBold.copyWith(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
