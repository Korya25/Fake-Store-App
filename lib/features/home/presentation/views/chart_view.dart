import 'package:flutter/material.dart';
import 'package:fake_store_app/core/widgets/custom_navigation_bar.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
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

  double get totalAmount => cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));

  void updateQuantity(int index, int delta) {
    setState(() {
      final newQuantity = cartItems[index]['quantity'] + delta;
      if (newQuantity > 0) {
        cartItems[index]['quantity'] = newQuantity;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text('My Bag',
            style: AppTextStyle.text.copyWith(fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) => CartItemCard(
                item: cartItems[index],
                onRemove: () => removeItem(index),
                onIncrease: () => updateQuantity(index, 1),
                onDecrease: () => updateQuantity(index, -1),
              ),
            ),
          ),
          CartTotalSection(total: totalAmount),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 2),
    );
  }
}
class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(item['title'],
                    style: AppTextStyle.descriptiveItems
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(item['brand'],
                    style: AppTextStyle.descriptionText
                        .copyWith(color: AppColors.grey)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('Color: ${item['color']}',
                        style: AppTextStyle.helperText
                            .copyWith(color: AppColors.grey)),
                    const SizedBox(width: 16),
                    Text('Size: ${item['size']}',
                        style: AppTextStyle.helperText
                            .copyWith(color: AppColors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _QuantityButton(
                          icon: Icons.remove,
                          color: AppColors.background,
                          onTap: onDecrease,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(item['quantity'].toString(),
                              style: AppTextStyle.descriptiveItems),
                        ),
                        _QuantityButton(
                          icon: Icons.add,
                          color: AppColors.primary,
                          onTap: onIncrease,
                        ),
                      ],
                    ),
                    Text('${item['price'].toStringAsFixed(2)}',
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
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16, color: AppColors.white),
      ),
    );
  }
}
class CartTotalSection extends StatelessWidget {
  final double total;

  const CartTotalSection({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('\$${total.toStringAsFixed(2)}',
                  style:
                      AppTextStyle.text.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: 'CHECK OUT',
            onPressed: () {
              // Implement checkout logic
            },
          ),
        ],
      ),
    );
  }
}
