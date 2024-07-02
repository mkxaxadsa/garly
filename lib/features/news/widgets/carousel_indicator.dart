import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator(this.active, {super.key});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 12,
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: active ? AppColors.blue : Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          )
        ],
      ),
    );
  }
}
