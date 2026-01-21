import 'package:e_commerce_clot/features/order/domain/entities/oreder_entity.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_order_card.dart';
import 'package:flutter/material.dart';

class MyOrdersListView extends StatelessWidget {
  const MyOrdersListView({super.key, required this.orders});
  final List<OrederEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemBuilder:
            (context, index) => MyOrderCard(orederEntity: orders[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: orders.length,
      ),
    );
  }
}

class LoaddingMyOrdersListView extends StatelessWidget {
  const LoaddingMyOrdersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemBuilder: (context, index) => const LoaddingMyOrderCard(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 10,
      ),
    );
  }
}
