import 'package:fake_store_app/core/widgets/category_chip.dart';
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/product_card.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu, color: AppColors.white),
                  ),
                  Text(
                    'Fashion sale',
                    style: AppTextStyle.text.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: AppColors.white),
                  ),
                ],
              ),
            ),
            
            // Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFFFF6B6B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fashion\nsale',
                          style: AppTextStyle.headlineSmall.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Check',
                            style: AppTextStyle.descriptiveItems.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: AppTextStyle.text.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: AppTextStyle.descriptionText.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Category chips
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CategoryChip(
                      label: categories[index],
                      isSelected: selectedCategory == categories[index],
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Products Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      imageUrl: product['image'],
                      title: product['title'],
                      brand: product['brand'],
                      price: product['price'],
                      rating: product['rating'],
                      isFavorite: product['isFavorite'],
                      reviewCount: 10,
                      onTap: () {
                        context.push('/product-details?id=${product['id']}');
                      },
                      onFavoritePressed: () {
                        setState(() {
                          products[index]['isFavorite'] = !products[index]['isFavorite'];
                        });
                      }, 
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 0,),
    );
  }
}
