import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'carousel_slider_card.dart';

class CustomCarouselSlider extends StatelessWidget {
   CustomCarouselSlider({super.key});

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      imageUrl: 'assets/slider_image/Small banner.png',
      title: 'Women\'s clothing',
      onTap: () {},
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/image 3 (1).png',
      title: 'Jewelery',
      onTap: () {},
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/image 2.png',
      title: 'Men\'s clothing',
      onTap: () {},
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/front-view-person-repairing-motherboard (1) 1.png',
      title: 'Electronics',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselSliderCard(item: carouselItems[index]);
      },
      options: CarouselOptions(
        height: 210,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
