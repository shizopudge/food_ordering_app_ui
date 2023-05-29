import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';

class MenuSearch extends StatelessWidget {
  const MenuSearch({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1,
      child: Container(
        height: 58,
        margin: const EdgeInsets.symmetric(horizontal: 36),
        decoration: BoxDecoration(
          borderRadius: kCircularBorderRadius30,
          color: kLightGrey,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: kPoppinsRegular.copyWith(
                    fontSize: 22,
                    color: kGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
