import 'package:flutter/material.dart';

import '../../../animations/fade_animation_x.dart';
import '../data/models/category.dart';
import '../menu_screen.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required ValueNotifier<String> selectedCategoryNotifier,
  }) : _selectedCategoryNotifier = selectedCategoryNotifier;

  final ValueNotifier<String> _selectedCategoryNotifier;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: 1.2,
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 28),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final FoodCategory category = categories[index];
            return CategoryCard(
              selectedCategoryNotifier: _selectedCategoryNotifier,
              category: category,
            );
          },
        ),
      ),
    );
  }
}
