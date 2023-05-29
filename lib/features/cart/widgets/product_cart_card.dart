import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';
import '../../menu/data/models/product.dart';
import '../../product/product_screen.dart';
import '../../product/widgets/product_count.dart';

class ProductCartCard extends StatefulWidget {
  final int id;
  final Product product;
  const ProductCartCard({
    super.key,
    required this.product,
    required this.id,
  });

  @override
  State<ProductCartCard> createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {
  late final ValueNotifier<int> _productCountNotifier;

  @override
  void initState() {
    _productCountNotifier = ValueNotifier<int>(1);
    super.initState();
  }

  @override
  void dispose() {
    _productCountNotifier.dispose();
    super.dispose();
  }

  void _onTap(BuildContext context) => Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.fade,
          child: ProductScreen(product: widget.product, id: widget.id),
        ),
      ).whenComplete(
        () => primaryFocus?.unfocus(),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: widget.id,
                child: GestureDetector(
                  onTap: () => _onTap(context),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.image,
                    fit: BoxFit.contain,
                    height: 130,
                    width: 100,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 130,
                      width: 100,
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: kCircularBorderRadius20,
                      ),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: kGrey.withOpacity(.1),
                      highlightColor: kLighterGrey,
                      child: Container(
                        height: 130,
                        width: 100,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: kCircularBorderRadius20,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Shimmer.fromColors(
                      baseColor: kGrey.withOpacity(.1),
                      highlightColor: kLighterGrey,
                      child: Container(
                        height: 130,
                        width: 100,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: kCircularBorderRadius20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: kPoppinsMedium.copyWith(
                      fontSize: 16,
                      color: kLighterBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: kPoppinsBold.copyWith(
                      fontSize: 16,
                      color: kGolden,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ProductCount(
                    productCountNotifier: _productCountNotifier,
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            borderRadius: kCircularBorderRadius20,
            child: const Icon(
              Icons.cancel_outlined,
              color: kRed,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
