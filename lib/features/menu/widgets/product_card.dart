import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../animations/fade_animation_x.dart';
import '../../../constants/constants.dart';
import '../../product/product_screen.dart';
import '../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int id;
  const ProductCard({
    super.key,
    required this.product,
    required this.id,
  });

  void _onTap(BuildContext context) => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.fade,
          child: ProductScreen(product: product, id: id),
        ),
      ).whenComplete(
        () => primaryFocus?.unfocus(),
      );

  @override
  Widget build(BuildContext context) {
    return FadeAnimationX(
      delay: .25,
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          margin: const EdgeInsets.only(
            right: 58,
          ),
          width: 161,
          decoration: BoxDecoration(
            borderRadius: kCircularBorderRadius20,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                kLighterGrey,
                kLightGrey,
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: id,
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: kGrey.withOpacity(.1),
                      highlightColor: kLighterGrey,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kCircularBorderRadius30,
                          color: kGrey,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Shimmer.fromColors(
                      baseColor: kGrey.withOpacity(.1),
                      highlightColor: kLighterGrey,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kCircularBorderRadius30,
                          color: kGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.title,
                style: kPoppinsRegular.copyWith(
                  fontSize: 18,
                  color: kLightBlack,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: kPoppinsSemiBold.copyWith(
                      color: kGolden,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.add_circle_rounded,
                      color: kGreen,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
