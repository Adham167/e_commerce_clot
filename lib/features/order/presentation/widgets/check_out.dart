import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/functions/cart.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key, required this.productList});
  final List<ProductOrderedEntity> productList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${Cart.calculateCartSubtotal(productList).toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$8',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text(
                '\$0.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${Cart.calculateCartSubtotal(productList) + 8}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          CustomButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).push(AppRouter.kCheckOutView, extra: productList);
            },
            title: "CheckOut",
          ),
        ],
      ),
    );
  }
}
