import 'package:e_commerce_clot/core/utils/app_bottom_sheet.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_sizes_cubit/product_sizes_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSizeWidget extends StatelessWidget {
  const SelectedSizeWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizesCubit>(context),
            child: ProductSizes(productEntity: productEntity),
          ),
        );
      },
      child: Container(
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
            const Text("Size ", style: AppStyle.styleMedium16),
            Row(
              children: [
                BlocBuilder<ProductSizesCubit, int>(
                  builder: (context, state) {
                    return Text(
                      productEntity.sizes[state],
                      style: AppStyle.styleBold16,
                    );
                  },
                ),
                const SizedBox(width: 12),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
