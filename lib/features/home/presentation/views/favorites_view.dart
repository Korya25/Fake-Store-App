import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_state.dart';
import 'package:fake_store_app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Favorites', style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    if (state is ProductLoaded) {
      final favoriteProducts =
          state.products.where((p) => p.isFavorite ?? false ).toList();

      if (favoriteProducts.isEmpty) {
        return const _EmptyFavorites();
      }

      return Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            return ProductCard(
              product: product,
              onFavoriteToggle: (id) {
                context.read<ProductCubit>().toggleFavorite(id);
              },
              onTap: (id) {
                context.pushNamed(AppRoutes.productDetails, extra: product);
              },
            );
          },
        ),
      );
    } else if (state is ProductLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const _EmptyFavorites();
    }
  },
)
,
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 2),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite_border, size: 80, color: AppColors.grey),
          const SizedBox(height: 16),
          Text('No favorites yet', style: AppTextStyle.text.copyWith(color: AppColors.grey)),
        ],
      ),
    );
  }
}
