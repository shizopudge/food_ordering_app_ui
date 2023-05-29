import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../product_screen.dart';
import 'addititve_card.dart';

class AdditiveListView extends StatelessWidget {
  const AdditiveListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 36,
            right: 26,
          ),
          child: Text(
            'Add ons',
            style: kPoppinsMedium.copyWith(
              color: kLighterBlack,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 36),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: additives.length,
            itemBuilder: (context, index) {
              final additive = additives[index];
              return AdditiveCard(additive: additive);
            },
          ),
        ),
      ],
    );
  }
}
