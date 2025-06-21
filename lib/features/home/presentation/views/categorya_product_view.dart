import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:fake_store_app/features/home/data/model/product_model.dart';
import 'package:fake_store_app/features/home/presentation/widgets/category_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_state.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsView extends StatefulWidget {
  final String category;

  const CategoryProductsView({super.key, required this.category});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProductsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category,style: AppTextStyle.subheads,)),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(child: Text('No Product Yet'));
            }
            return GridView.builder(
  padding: const EdgeInsets.all(16),
  itemCount: products.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.65,
  ),
  itemBuilder: (context, index) {
    final product = products[index];
   return CategoryProductCard(
  product: product,
  onTap: () {
    context.pushNamed(AppRoutes.productDetails, extra: product);
  },
  onToggleFavorite: () {
    context.read<ProductCubit>().toggleFavorite(product.id);
  },
  onAddToCart: () {
    context.read<ProductCubit>().addToCart(product);
  },
);

  },
);

          } else if (state is ProductError) {
            return Center(child: Text('Error :${state.message}'));
          } else {
            return const Center(child: Text('No data Yet'));
          }
        },
      ),
    );
  }
}
