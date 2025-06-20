import 'package:dartz/dartz.dart';
import 'package:fake_store_app/core/errors/exceptions.dart';
import '../../../../core/api/api_consumer.dart';
import '../model/product_model.dart';

class ProductRepo {
  final ApiConsumer api;

  ProductRepo({required this.api});

  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await api.get('/products');
      final products = (response as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } on ServerException catch (e) {

      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, ProductModel>> getProductById(int id) async {
    try {
      final response = await api.get('/products/$id');
      return Right(ProductModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, List<ProductModel>>> getProductsByCategory(
      String category) async {
    try {
      final response = await api.get('/products/category/$category');
      final products = (response as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, List<String>>> getAllCategories() async {
    try {
      final response = await api.get('/products/categories');
      return Right(List<String>.from(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
