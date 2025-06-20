import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:fake_store_app/features/home/data/model/fake_products.dart';
import 'package:fake_store_app/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // Cart item model: product + quantity
  List<_CartProduct> cartItems = [
    _CartProduct(product: fakeProducts[0], quantity: 1),
    _CartProduct(product: fakeProducts[1], quantity: 2),
    _CartProduct(product: fakeProducts[2], quantity: 1),
  ];

  double get totalAmount => cartItems.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('My Bag',
            style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _CartItem(
                  cartProduct: item,
                  onRemove: () => setState(() => cartItems.removeAt(index)),
                  onQtyChanged: (delta) {
                    setState(() {
                      item.quantity = (item.quantity + delta).clamp(1, 99);
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total amount:',
                        style: AppTextStyle.descriptiveItems
                            .copyWith(color: AppColors.grey)),
                    Text('\$${totalAmount.toStringAsFixed(2)}',
                        style: AppTextStyle.text
                            .copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 16),
                PrimaryButton(text: 'CHECK OUT', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 1),
    );
  }
}

// Helper class to pair ProductModel with quantity
class _CartProduct {
  final ProductModel product;
  int quantity;
  _CartProduct({required this.product, this.quantity = 1});
}

class _CartItem extends StatelessWidget {
  final _CartProduct cartProduct;
  final VoidCallback onRemove;
  final Function(int) onQtyChanged;

  const _CartItem({
    required this.cartProduct,
    required this.onRemove,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final product = cartProduct.product;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.dark, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(product.image,
                width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: AppTextStyle.descriptiveItems
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(product.category,
                    style: AppTextStyle.descriptionText
                        .copyWith(color: AppColors.grey)),
                const SizedBox(height: 4),
                // If you have color/size, display here, else skip
                // Row(
                //   children: [
                //     Text('Color: ...', style: ...),
                //     const SizedBox(width: 16),
                //     Text('Size: ...', style: ...),
                //   ],
                // ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _qtyBtn(Icons.remove, () => onQtyChanged(-1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(cartProduct.quantity.toString(),
                              style: AppTextStyle.descriptiveItems),
                        ),
                        _qtyBtn(Icons.add, () => onQtyChanged(1),
                            color: AppColors.primary),
                      ],
                    ),
                    Text('\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyle.descriptiveItems
                            .copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.more_vert, color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap,
      {Color color = AppColors.background}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        child: Icon(icon, size: 16, color: AppColors.white),
      ),
    );
  }
}
