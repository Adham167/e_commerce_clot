import 'package:e_commerce_clot/features/order/domain/entities/order_status_entity.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';

class OrederEntity {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrederEntity({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
