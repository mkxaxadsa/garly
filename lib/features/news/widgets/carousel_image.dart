import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/news.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    super.key,
    required this.carouselNews,
    required this.index,
  });

  final CarouselNews carouselNews;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width - 50 > 400
                  ? 400
                  : double.infinity,
              child: CachedNetworkImage(
                imageUrl: carouselNews.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 6,
            bottom: 6,
            child: SizedBox(
              width: 150,
              child: Text(
                carouselNews.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
