import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantityWidget extends StatelessWidget {
  const ProductQuantityWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Quantity ", style: AppStyle.styleMedium16),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<ProductQuantityCubit>(context).decrement();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(state.toString(), style: AppStyle.styleMedium16);
                },
              ),

              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  BlocProvider.of<ProductQuantityCubit>(context).increment();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
