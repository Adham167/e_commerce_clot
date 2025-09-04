import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/functions/total_price.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_reactive_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_colors_cubit/product_colors_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_sizes_cubit/product_sizes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBagWidget extends StatelessWidget {
  const AddToBagWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomReactiveButton(
        onPressed: () {
          BlocProvider.of<ButtonCubit>(context).execute(
            usecase: AddToCartUsecase(),
            params: AddToCartModel(
              productId: productEntity.productId,
              productTitle: productEntity.title,
              productQuantity:
                  BlocProvider.of<ProductQuantityCubit>(context).state,
              productColor:
                  productEntity
                      .colors[BlocProvider.of<ProductColorsCubit>(
                        context,
                      ).selectedIndex]
                      .title,
              productSize:
                  productEntity.sizes[BlocProvider.of<ProductSizesCubit>(
                    context,
                  ).selectedIndex],
              productPrice: productEntity.price.toDouble(),
              totalPrice:
                  TotalPrice.getTotalPrice(productEntity) *
                  BlocProvider.of<ProductQuantityCubit>(context).state,
              productImage: productEntity.images[0],
              createdDate: DateTime.now().toString(),
            ),
          );
        },
        title: "",
        height: 60,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductQuantityCubit, int>(
              builder: (context, state) {
                var price = TotalPrice.getTotalPrice(productEntity) * state;
                return Text(
                  '\$${price.toString()}',
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
