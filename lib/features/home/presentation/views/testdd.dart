/*
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';

// Main Product Details View

// Product Image Sliver Widget
class ProductImageSliver extends StatelessWidget {
  final List<String> images;

  const ProductImageSliver({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      backgroundColor: AppColors.background,
      iconTheme: const IconThemeData(color: AppColors.white),
      actions: [
        IconButton(
          onPressed: () {
            // Handle share functionality
          },
          icon: const Icon(Icons.share),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: ProductImageCarousel(images: images),
      ),
    );
  }
}

// Product Image Carousel Widget
class ProductImageCarousel extends StatelessWidget {
  final List<String> images;

  const ProductImageCarousel({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: AppColors.dark,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.dark,
              child: const Center(
                child: Icon(Icons.error, color: AppColors.grey),
              ),
            );
          },
        );
      },
    );
  }
}

// Product Details Content Widget
class ProductDetailsContent extends StatelessWidget {
  final ProductModel product;
  final String selectedSize;
  final int selectedColorIndex;
  final List<String> sizes;
  final List<Color> colors;
  final Function(String) onSizeSelected;
  final Function(int) onColorSelected;

  const ProductDetailsContent({
    super.key,
    required this.product,
    required this.selectedSize,
    required this.selectedColorIndex,
    required this.sizes,
    required this.colors,
    required this.onSizeSelected,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductHeader(product: product),
            const SizedBox(height: 16),
            ProductRating(rating: product.rating),
            const SizedBox(height: 20),
            SizeSelector(
              sizes: sizes,
              selectedSize: selectedSize,
              onSizeSelected: onSizeSelected,
            ),
            const SizedBox(height: 20),
            ColorSelector(
              colors: colors,
              selectedColorIndex: selectedColorIndex,
              onColorSelected: onColorSelected,
            ),
            const SizedBox(height: 20),
            ProductDescription(description: product.description),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Product Header Widget
class ProductHeader extends StatelessWidget {
  final ProductModel product;

  const ProductHeader({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: AppTextStyle.subheads,
              ),
              const SizedBox(height: 4),
              Text(
                product.brand,
                style: AppTextStyle.descriptiveItems.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: AppTextStyle.subheads.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

// Product Rating Widget
class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating.floor()
                  ? Icons.star
                  : Icons.star_border,
              color: Colors.amber,
              size: 20,
            );
          }),
        ),
        const SizedBox(width: 8),
        Text(
          '($rating)',
          style: AppTextStyle.descriptionText.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

// Size Selector Widget
class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: AppTextStyle.descriptiveItems.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: sizes.map((size) {
            final isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () => onSizeSelected(size),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.dark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  size,
                  style: AppTextStyle.descriptiveItems.copyWith(
                    color: isSelected
                        ? AppColors.white
                        : AppColors.ordinaryText,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Color Selector Widget
class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedColorIndex;
  final Function(int) onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: AppTextStyle.descriptiveItems.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: colors.asMap().entries.map((entry) {
            final index = entry.key;
            final color = entry.value;
            final isSelected = selectedColorIndex == index;
            
            return GestureDetector(
              onTap: () => onColorSelected(index),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected 
                        ? AppColors.primary 
                        : AppColors.grey.withOpacity(0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: color == Colors.white ? Colors.black : AppColors.white,
                        size: 20,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Product Description Widget
class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyle.descriptiveItems.copyWith(
        color: AppColors.grey,
        height: 1.5,
      ),
    );
  }
}

// Product Bottom Bar Widget
class ProductBottomBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart;

  const ProductBottomBar({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.dark,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onFavoriteToggle,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey.withOpacity(0.3)),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColors.primary : AppColors.grey,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: PrimaryButton(
              text: 'ADD TO CART',
              onPressed: onAddToCart,
            ),
          ),
        ],
      ),
    );
  }
}

// Add to Cart Bottom Sheet
class AddToCartBottomSheet {
  static void show({
    required BuildContext context,
    required ProductModel product,
    required String selectedSize,
    required Color selectedColor,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.dark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => AddToCartContent(
        product: product,
        selectedSize: selectedSize,
        selectedColor: selectedColor,
      ),
    );
  }
}

// Add to Cart Content Widget
class AddToCartContent extends StatefulWidget {
  final ProductModel product;
  final String selectedSize;
  final Color selectedColor;

  const AddToCartContent({
    super.key,
    required this.product,
    required this.selectedSize,
    required this.selectedColor,
  });

  @override
  State<AddToCartContent> createState() => _AddToCartContentState();
}

class _AddToCartContentState extends State<AddToCartContent> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void _addToCart() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added to cart successfully!',
          style: AppTextStyle.descriptiveItems,
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Select size and color',
            style: AppTextStyle.text.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          CartItemRow(
            product: widget.product,
            quantity: quantity,
            onIncrement: _incrementQuantity,
            onDecrement: _decrementQuantity,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: 'ADD TO CART',
            onPressed: _addToCart,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// Cart Item Row Widget
class CartItemRow extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemRow({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.images.first,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                color: AppColors.grey,
                child: const Icon(Icons.error, color: AppColors.white),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: AppTextStyle.descriptiveItems.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: AppTextStyle.descriptiveItems.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        QuantitySelector(
          quantity: quantity,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}

// Quantity Selector Widget
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.remove,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            quantity.toString(),
            style: AppTextStyle.descriptiveItems,
          ),
        ),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

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
}*/