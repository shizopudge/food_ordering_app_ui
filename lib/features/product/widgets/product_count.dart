import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ProductCount extends StatelessWidget {
  final ValueNotifier<int> _productCountNotifier;
  const ProductCount({
    super.key,
    required ValueNotifier<int> productCountNotifier,
  }) : _productCountNotifier = productCountNotifier;

  void _addProduct() => _productCountNotifier.value += 1;

  void _removeProduct() {
    if (_productCountNotifier.value > 1) {
      _productCountNotifier.value -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: _removeProduct,
          child: const Icon(
            Icons.remove_circle_outline,
            color: kDarkPurple,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        ValueListenableBuilder(
          valueListenable: _productCountNotifier,
          builder: (context, productCount, _) => Text(
            productCount.toString(),
            style: kPoppinsRegular.copyWith(
              color: kBlack,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: _addProduct,
          child: const Icon(
            Icons.add_circle_outline,
            color: kDarkPurple,
            size: 24,
          ),
        ),
      ],
    );
  }
}
