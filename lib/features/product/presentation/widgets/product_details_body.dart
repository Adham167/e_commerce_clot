import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_images.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_quantity_widget.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/selected_color_widget.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/selected_size_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImages(productEntity: productEntity),
          const SizedBox(height: 12),
          Text(productEntity.title, style: AppStyle.styleBold16),
          const SizedBox(height: 12),
          Text(
            productEntity.discountedPrice != 0
                ? '\$ ${productEntity.discountedPrice}'
                : '\$ ${productEntity.price}',
            style: AppStyle.styleBold16.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 32),
          SelectedSizeWidget(productEntity: productEntity),
          const SizedBox(height: 16),
          SelectedColorWidget(productEntity: productEntity),
          const SizedBox(height: 16),
          ProductQuantityWidget(productEntity: productEntity),
        ],
      ),
    );
  }
}
