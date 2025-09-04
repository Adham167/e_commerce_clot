import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class SelectedSizeWidget extends StatelessWidget {
  const SelectedSizeWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.secondbackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Size ", style: AppStyle.styleMedium16),
          Row(
            children: [
              Text("S", style: AppStyle.styleBold16),
              SizedBox(width: 12),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ],
      ),
    );
  }
}
