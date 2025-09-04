import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class AddToBagWidget extends StatelessWidget {
  const AddToBagWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      title: "",
      height: 70,
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Price", style: AppStyle.styleMedium24),
          Text("Add to Bag", style: AppStyle.styleMedium24),
        ],
      ),
    );
  }
}
