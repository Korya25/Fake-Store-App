
import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/features/home/data/model/fake_products.dart';
import 'package:fake_store_app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProductCardsSection extends StatelessWidget {
  const ProductCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: fakeProducts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final product = fakeProducts[index];
          return ProductCard(
            product: product,
            onFavoriteToggle: (id) {
            },
            onTap: (id) {
              context.pushNamed(AppRoutes.productDetails);
            },
          );
        },
      ),
    );
  }
}
