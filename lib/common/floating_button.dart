import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FloatingButton extends StatelessWidget {
  final String title;
  const FloatingButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60).copyWith(bottom: 20),
        height: 68,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: kCircularBorderRadius20,
          color: kDarkPurple,
          boxShadow: const [
            BoxShadow(
              color: kGrey,
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: kPoppinsSemiBold.copyWith(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
