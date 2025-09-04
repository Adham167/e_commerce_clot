import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/functions/total_price.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBagWidget extends StatelessWidget {
  const AddToBagWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomButton(
        onPressed: () {},
        title: "",
        height: 60,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductQuantityCubit, int>(
              builder: (context, state) {
                var price = TotalPrice.getTotalPrice(productEntity) * state;
                return Text(
                  '\$${price.toString() }',
                  style: AppStyle.styleBold24,
                );
              },
            ),
            const Text("Add to Bag", style: AppStyle.styleMedium24),
          ],
        ),
      ),
    );
  }
}
