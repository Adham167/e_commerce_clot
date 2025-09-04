import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';

class TotalPrice {
  static double getTotalPrice(ProductEntity product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}
