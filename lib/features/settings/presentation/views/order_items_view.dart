import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:e_commerce_clot/features/order/presentation/widgets/product_ordered_listview.dart';
import 'package:flutter/material.dart';

class OrderItemsView extends StatelessWidget {
  const OrderItemsView({super.key, required this.products});
  final List<ProductOrderedEntity> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Order Items", style: AppStyle.styleBold24),
      ),
      body: ProductOrderedListview(products: products, isOrdered: true),
    );
  }
}
