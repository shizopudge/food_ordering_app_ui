import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../animations/fade_animation_x.dart';
import '../../animations/fade_animation_y.dart';
import '../../constants/constants.dart';
import '../menu/data/models/product.dart';
import 'data/models/additive.dart';
import 'widgets/addititve_listview.dart';
import '../../common/floating_button.dart';
import 'widgets/product_count.dart';
import 'widgets/product_image.dart';
import 'widgets/product_rating.dart';

const List<Additive> additives = [
  Additive(
    image: 'assets/images/cheese.png',
    title: 'Cheese',
  ),
  Additive(
    image: 'assets/images/sous.png',
    title: 'Sous',
  ),
  Additive(
    image: 'assets/images/sous2.png',
    title: 'Hot sous',
  ),
  Additive(
    image: 'assets/images/cheese.png',
    title: 'Cheese',
  ),
  Additive(
    image: 'assets/images/sous.png',
    title: 'Sous',
  ),
  Additive(
    image: 'assets/images/sous2.png',
    title: 'Hot sous',
  ),
];

class ProductScreen extends StatefulWidget {
  final Product product;
  final int id;
  const ProductScreen({
    super.key,
    required this.product,
    required this.id,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final ValueNotifier<int> _productCountNotifier;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _productCountNotifier = ValueNotifier<int>(1);

    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _productCountNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FadeAnimationX(
        delay: 1,
        child: FloatingButton(
          title: 'Add to cart',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              kDarkPurple,
              kLightPurple,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ProductImage(
                      id: widget.id,
                      image: widget.product.image,
                    ),
                    FadeAnimationY(
                      delay: 1.0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 36, top: 40),
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              'assets/icons/arrow_back.svg',
                              height: 26,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        70,
                      ),
                    ),
                  ),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      FadeAnimationX(
                        delay: 1.1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 36,
                            right: 26,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ProductRating(),
                              Text(
                                '\$${widget.product.price}',
                                style: kPoppinsBold.copyWith(
                                  color: kGolden,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimationX(
                        delay: 1.2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 36,
                            right: 26,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.product.title,
                                style: kPoppinsMedium.copyWith(
                                  color: kBlack,
                                  fontSize: 22,
                                ),
                              ),
                              ProductCount(
                                productCountNotifier: _productCountNotifier,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimationX(
                        delay: 1.3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 36,
                            right: 26,
                          ),
                          child: Text(
                            'Big juicy beef burger with cheese, lettuce, tomato, onions and special sauce!',
                            style: kPoppinsLight.copyWith(
                                fontSize: 18, color: kGrey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const FadeAnimationX(
                        delay: 1.3,
                        child: AdditiveListView(),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
