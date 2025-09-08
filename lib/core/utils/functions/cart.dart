import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';

class Cart {
  static double calculateCartSubtotal(List<ProductOrderedEntity> products) {
    double subtotalPrice = 0;
    for (var item in products) {
      subtotalPrice = subtotalPrice + item.totalPrice;
    }
    return subtotalPrice;
  }
}
