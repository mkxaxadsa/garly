import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/widgets/nav_bar_title.dart';
import '../models/news.dart';
import '../widgets/carousel_image.dart';
import '../widgets/carousel_indicator.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75),
      child: ListView(
        children: [
          const SizedBox(height: 32),
          const PageTitle('News'),
          const SizedBox(height: 16),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 120,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
            ),
            itemCount: carouselNews.length,
            itemBuilder: (context, index, realIndex) {
              return CarouselImage(
                carouselNews: carouselNews[index],
                index: index,
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselIndicator(_index == 0),
              CarouselIndicator(_index == 1),
              CarouselIndicator(_index == 2),
              CarouselIndicator(_index == 3),
            ],
          ),
          const SizedBox(height: 20),
          ...List<Widget>.generate(
            news.length,
            (index) {
              return NewsCard(
                news: news[index],
                ago: index,
                onPressed: () {
                  context.push('/news-detail', extra: news[index]);
                },
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
