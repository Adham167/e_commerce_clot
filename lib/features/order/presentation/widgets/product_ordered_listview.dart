import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:e_commerce_clot/features/order/presentation/widgets/product_ordered_cart.dart';
import 'package:flutter/material.dart';

class ProductOrderedListview extends StatelessWidget {
  const ProductOrderedListview({super.key, required this.products});
  final List<ProductOrderedEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ProductOrderedCard(productOrderedEntity: products[index]),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }
}
