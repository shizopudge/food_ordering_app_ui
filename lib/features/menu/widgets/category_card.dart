import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';
import '../data/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required ValueNotifier<String> selectedCategoryNotifier,
    required this.category,
  }) : _selectedCategoryNotifier = selectedCategoryNotifier;

  final ValueNotifier<String> _selectedCategoryNotifier;
  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: .25,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
        ),
        child: GestureDetector(
          onTap: () => _selectedCategoryNotifier.value = category.title,
          child: ValueListenableBuilder(
            valueListenable: _selectedCategoryNotifier,
            builder: (context, selectedCategory, _) => Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: kCircularBorderRadius20,
                    color: selectedCategory == category.title
                        ? kDarkPurple
                        : kLightGrey,
                  ),
                  child: Image.asset(
                    category.image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.linear,
                  child: Text(
                    category.title,
                    style: kPoppinsRegular.copyWith(
                      fontSize: 17,
                      color: selectedCategory == category.title
                          ? kDarkPurple
                          : kGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
