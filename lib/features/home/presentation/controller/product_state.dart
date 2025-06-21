import 'package:fake_store_app/features/home/data/model/cart_product.dart';
import 'package:fake_store_app/features/home/data/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded(this.products);
}

class ProductDetailsLoaded extends ProductState {
  final ProductModel product;
  ProductDetailsLoaded(this.product);
}

class ProductCategoriesLoaded extends ProductState {
  final List<String> categories;
  ProductCategoriesLoaded(this.categories);
}

class ProductCartUpdated extends ProductState {
  final List<CartProduct> cartItems;
  ProductCartUpdated(this.cartItems);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
