import 'package:e_commerce_clot/features/order/domain/entities/oreder_entity.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_order_card.dart';
import 'package:flutter/material.dart';

class MyOrdersListView extends StatelessWidget {
  const MyOrdersListView({super.key, required this.orders});
  final List<OrederEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) =>  MyOrderCard(orederEntity: orders[index],),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: orders.length,
      ),
    );
  }
}
