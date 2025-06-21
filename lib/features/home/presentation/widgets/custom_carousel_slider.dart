import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:go_router/go_router.dart';
import 'carousel_slider_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({super.key});

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      imageUrl: 'assets/slider_image/Small banner.png',
      title: 'women\'s clothing',
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/image 3 (1).png',
      title: 'jewelery',
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/image 2.png',
      title: 'men\'s clothing',
    ),
    CarouselItem(
      imageUrl: 'assets/slider_image/front-view-person-repairing-motherboard (1) 1.png',
      title: 'electronics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = carouselItems[index];
        return  CarouselSliderCard(
  item: item,
  onTap: () {
   context.pushNamed(
  AppRoutes.categoryProducts,
  extra: item.title,
);
  },
);

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
