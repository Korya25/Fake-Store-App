import 'package:fake_store_app/features/home/data/model/cart_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/product_repo.dart';
import '../../data/model/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo repo;

  ProductCubit(this.repo) : super(ProductInitial());

  List<ProductModel> _products = [];
  final List<CartProduct> _cart = [];

  void getAllProducts() async {
    emit(ProductLoading());
    final result = await repo.getAllProducts();
    result.fold(
      (error) => emit(ProductError(error)),
      (products) {
        _products = products;
        emit(ProductLoaded(_products));
      },
    );
  }


  Future<void> getProductById(int id) async {
    emit(ProductLoading());
    final result = await repo.getProductById(id);
    result.fold(
      (error) => emit(ProductError(error)),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }

  void getProductsByCategory(String category) async {
    emit(ProductLoading());
    final result = await repo.getProductsByCategory(category);
    result.fold(
      (error) => emit(ProductError(error)),
      
      (products) {
        _products = products;
        emit(ProductLoaded(_products));
      },
    );
  }

  void getAllCategories() async {
  emit(ProductLoading());
  final result = await repo.getAllCategories();
  result.fold(
    (failure) {
      emit(ProductError(failure));
    },
    (categories) {
      emit(ProductCategoriesLoaded(categories));
    },
  );
}


  void toggleFavorite(int id) {
    _products = _products.map((product) {
      if (product.id == id) {
        return product.copyWith(isFavorite: !(product.isFavorite ));
      }
      return product;
    }).toList();
    emit(ProductLoaded(_products));
  }

  void addToCart(ProductModel product) {
    final index = _cart.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartProduct(product: product, quantity: 1));
    }
    emit(ProductCartUpdated(List.from(_cart)));
  }

  void changeCartQty(int productId, int delta) {
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _cart[index].quantity = (_cart[index].quantity + delta).clamp(1, 99);
      emit(ProductCartUpdated(List.from(_cart)));
    }
  }

  void removeFromCart(int productId) {
    _cart.removeWhere((item) => item.product.id == productId);
    emit(ProductCartUpdated(List.from(_cart)));
  }

  
}
