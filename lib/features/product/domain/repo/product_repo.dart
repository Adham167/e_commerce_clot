import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);

  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}
