import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../animations/fade_animation_x.dart';
import '../../animations/fade_animation_y.dart';
import '../../common/floating_button.dart';
import '../../constants/constants.dart';
import '../menu/data/models/product.dart';
import '../menu/menu_screen.dart';
import 'widgets/product_cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final StreamSubscription<bool> _keyboardSubscription;
  late final KeyboardVisibilityController _keyboardVisibilityController;
  late final TextEditingController _instructionsController;
  late final ValueNotifier<bool> _isKeyboardVisibleNotifier;

  @override
  void initState() {
    _instructionsController = TextEditingController();
    _isKeyboardVisibleNotifier = ValueNotifier<bool>(false);
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription = _keyboardVisibilityController.onChange.listen(
      (isVisible) => _isKeyboardVisibleNotifier.value = isVisible,
    );
    super.initState();
  }

  @override
  void dispose() {
    _keyboardSubscription.cancel();
    _isKeyboardVisibleNotifier.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isKeyboardVisibleNotifier,
      builder: (context, isKeyboardVisible, _) => Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
          children: [
            FadeAnimationY(
              delay: 1,
              child: Text(
                '${products.length} items in cart',
                style: kPoppinsRegular.copyWith(
                  color: kLightBlack,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeAnimationY(
              delay: 1,
              child: SizedBox(
                height: 285,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final Product product = products[index];
                    return ProductCartCard(
                      product: product,
                      id: index,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeAnimationY(
              delay: 1.1,
              child: Text(
                'Order Instructions',
                style: kPoppinsMedium.copyWith(
                  fontSize: 16,
                  color: kLighterBlack,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FadeAnimationY(
              delay: 1.2,
              child: TextField(
                controller: _instructionsController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: kCircularBorderRadius20,
                    borderSide: const BorderSide(
                      color: kLighterBlack,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            FadeAnimationY(
              delay: 1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: kPoppinsMedium.copyWith(
                      color: kLighterBlack,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '\$158.0',
                    style: kPoppinsBold.copyWith(
                      color: kGolden,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            const FadeAnimationX(
              delay: 1,
              child: FloatingButton(
                title: 'Checkout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
