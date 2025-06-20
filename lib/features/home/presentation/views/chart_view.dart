

import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'title': 'Pullover',
      'brand': 'Mango',
      'color': 'Gray',
      'size': 'L',
      'price': 51.0,
      'quantity': 1,
      'image': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    },
    {
      'id': '2',
      'title': 'T-shirt',
      'brand': 'Dorothy Perkins',
      'color': 'Yellow',
      'size': 'M',
      'price': 30.0,
      'quantity': 1,
      'image': 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
    },
    {
      'id': '3',
      'title': 'Sport Dress',
      'brand': 'Dorothy Perkins',
      'color': 'Black',
      'size': 'M',
      'price': 43.0,
      'quantity': 1,
      'image': 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    },
  ];

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'My Bag',
          style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: AppTextStyle.descriptiveItems.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['brand'],
                              style: AppTextStyle.descriptionText.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Color: ${item['color']}',
                                  style: AppTextStyle.helperText.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Size: ${item['size']}',
                                  style: AppTextStyle.helperText.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (item['quantity'] > 1) {
                                          setState(() {
                                            item['quantity']--;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 16,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        item['quantity'].toString(),
                                        style: AppTextStyle.descriptiveItems,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item['quantity']++;
                                        });
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${item['price'].toStringAsFixed(2)}',
                                  style: AppTextStyle.descriptiveItems.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.more_vert,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    Text(
                      'Total amount:',
                      style: AppTextStyle.descriptiveItems.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      '\${totalAmount.toStringAsFixed(2)}',
                      style: AppTextStyle.text.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'CHECK OUT',
                  onPressed: () {
                    // Handle checkout
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 2),
    );
  }
}
