import 'package:fake_store_app/core/widgets/category_chip.dart';
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/product_card.dart';
import 'package:fake_store_app/features/home/presentation/widgets/carousel_slider_card.dart';
import 'package:fake_store_app/features/home/presentation/widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedCategory = 'New';
  final List<String> categories = ['New', 'Clothes', 'Shoes', 'Accessories'];
  
  // Mock data
  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'title': 'Evening Dress',
      'brand': 'Dorothy Perkins',
      'price': 15.0,
      'rating': 4.5,
      'image': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
      'isFavorite': false,
    },
    {
      'id': '2',
      'title': 'Sport Dress',
      'brand': 'Sitlly',
      'price': 19.0,
      'rating': 4.0,
      'image': 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
      'isFavorite': true,
    },
    {
      'id': '3',
      'title': 'T-Shirt Sailing',
      'brand': 'LIME',
      'price': 14.0,
      'rating': 5.0,
      'image': 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      'isFavorite': false,
    },
    {
      'id': '4',
      'title': 'Short Dress',
      'brand': 'Dorothy Perkins',
      'price': 12.0,
      'rating': 4.2,
      'image': 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg',
      'isFavorite': false,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
      SliverToBoxAdapter(child: CustomCarouselSlider()),

      SliverToBoxAdapter()

        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 0,),
    );
  }
}
