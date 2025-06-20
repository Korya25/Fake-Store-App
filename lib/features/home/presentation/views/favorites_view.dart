
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final List<Map<String, dynamic>> favoriteProducts = [
    {
      'id': '1',
      'title': 'LIME',
      'brand': 'Shirt',
      'price': 32.0,
      'rating': 4.5,
      'image': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
      'isFavorite': true,
    },
    {
      'id': '2',
      'title': 'Mango',
      'brand': 'Longsleeve Violeta',
      'price': 46.0,
      'rating': 4.0,
      'image': 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
      'isFavorite': true,
    },
    {
      'id': '3',
      'title': 'Olivier',
      'brand': 'Shirt',
      'price': 52.0,
      'rating': 5.0,
      'image': 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      'isFavorite': true,
    },
    {
      'id': '4',
      'title': 'Mango',
      'brand': 'Longsleeve Violeta',
      'price': 57.0,
      'rating': 4.2,
      'image': 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg',
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Favorites',
          style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: AppColors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: AppTextStyle.text.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
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
                        favoriteProducts.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 3),
    );
  }
}