import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'dart:math' as math;

import '../../../constants/constants.dart';

class ProductImage extends StatelessWidget {
  final int id;
  final String image;
  const ProductImage({
    super.key,
    required this.id,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 50),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Transform.rotate(
              angle: 25 * math.pi / 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: kCircularBorderRadius20,
                  boxShadow: [
                    BoxShadow(
                      color: kWhite.withOpacity(.095),
                      blurRadius: 18.0,
                      spreadRadius: 15.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: id,
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
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
        ],
      ),
    );
  }
}
