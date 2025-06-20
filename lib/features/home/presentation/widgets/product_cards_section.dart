import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_cubit.dart';
import 'package:fake_store_app/features/home/presentation/controller/product_state.dart';
import 'package:fake_store_app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductCardsSection extends StatefulWidget {
  const ProductCardsSection({super.key});

  @override
  State<ProductCardsSection> createState() => _ProductCardsSectionState();
}

class _ProductCardsSectionState extends State<ProductCardsSection> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return SizedBox(
            height: 350,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onFavoriteToggle: (id) {
                    context.read<ProductCubit>().toggleFavorite(id);
                  },
                  onTap: (id) {
                    context.pushNamed(
                      AppRoutes.productDetails,
                      extra: product,
                    );
                  },
                );
              },
            ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
