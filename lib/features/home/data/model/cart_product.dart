import 'product_model.dart';

class CartProduct {
  final ProductModel product;
  int quantity;

  CartProduct({required this.product, this.quantity = 1});
}
