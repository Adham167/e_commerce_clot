import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/order/domain/entities/oreder_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orederEntity});
  final OrederEntity orederEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Order #${orederEntity.code}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            const SizedBox(height: 50),
            _items(context),
            const SizedBox(height: 30),
            _shipping(),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color:
                        orederEntity.orderStatus[index].done
                            ? AppColors.primary
                            : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child:
                      orederEntity.orderStatus[index].done
                          ? const Icon(Icons.check)
                          : Container(),
                ),
                const SizedBox(width: 15),
                Text(
                  orederEntity.orderStatus[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:
                        orederEntity.orderStatus[index].done
                            ? Colors.white
                            : Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              orederEntity.orderStatus[index].createdDate
                  .toDate()
                  .toString()
                  .split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color:
                    orederEntity.orderStatus[index].done
                        ? Colors.white
                        : Colors.grey,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 50),
      reverse: true,
      itemCount: orederEntity.orderStatus.length,
    );
  }

  Widget _items(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_rounded),
                    const SizedBox(width: 20),
                    Text(
                      '${orederEntity.products.length} Items',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRouter.kOrderItemsView,extra: orederEntity.products),
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(orederEntity.shippingAddress),
        ),
      ],
    );
  }
}
