
import 'package:fake_store_app/core/widgets/category_chip.dart';
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/custom_search_bar.dart';
import 'package:fake_store_app/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatefulWidget {
  final String category;

  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String selectedFilter = 'Popular';
  final List<String> filters = ['Popular', 'Newest', 'Customer review', 'Price: lowest to high', 'Price: highest to low'];
  
  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'title': "Women's tops",
      'brand': 'Dorothy Perkins',
      'price': 12.0,
      'rating': 4.5,
      'image': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
      'isFavorite': false,
    },
    {
      'id': '2',
      'title': 'Blouse',
      'brand': 'Dorothy Perkins',
      'price': 34.0,
      'rating': 4.0,
      'image': 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
      'isFavorite': true,
    },
    {
      'id': '3',
      'title': 'T-Shirt',
      'brand': 'LOST INK',
      'price': 12.0,
      'rating': 5.0,
      'image': 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      'isFavorite': false,
    },
    {
      'id': '4',
      'title': 'Shirt',
      'brand': 'Topshop',
      'price': 51.0,
      'rating': 4.2,
      'image': 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg',
      'isFavorite': false,
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
          "Women's tops",
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomSearchBar(
              onTap: () {
                showFilterBottomSheet(context);
              },
            ),
          ),
          
          // Filter Chips
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3, // Show only first 3 filters
              itemBuilder: (context, index) {
                final filterOptions = ['Popular', 'Newest', 'Price'];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryChip(
                    label: filterOptions[index],
                    isSelected: selectedFilter.contains(filterOptions[index]),
                    onTap: () {
                      setState(() {
                        selectedFilter = filterOptions[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Products Grid
          Expanded(
            child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عنصرين في الصف
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 270, // الطول العمودي لكل كرت
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title'],
                    brand: product['brand'],
                    price: product['price'],
                    rating: product['rating'],
                    imageUrl: product['image'],
                    isFavorite: product['isFavorite'],
                    reviewCount: 10,
                    onTap: () {
                      // انتقل لصفحة التفاصيل
                      context.push('/product/${product['id']}');
                    },
                    onFavoritePressed: () {
                      setState(() {
                        products[index]['isFavorite'] = !product['isFavorite'];
                      });
                    }, 
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar( selectedIndex: 0,),
    );
  }
void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort by',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
            ),
            const SizedBox(height: 16),
            ...filters.map((filter) {
              return ListTile(
                title: Text(filter, style: const TextStyle(color: AppColors.white)),
                trailing: selectedFilter == filter
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ],
        ),
      );
    },
  );
}
}