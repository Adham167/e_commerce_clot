import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/functions/cart.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_reactive_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/order/data/models/order_registration_model.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/order_registration_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckOutView extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckOutView({required this.products, super.key});

  final TextEditingController _addressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Checkout', style: AppStyle.styleBold24),
      ),
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kOrderPlacedView);
            }
            if (state is ButtonFailure) {
              var snackbar = SnackBar(
                content: Text(state.errMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _addressField(context),
                    CustomReactiveButton(
                      content: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${Cart.calculateCartSubtotal(products)}',
                              style: AppStyle.styleBold16,
                            ),
                            const Text(
                              'Place Order',
                              style: AppStyle.styleBold16,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<ButtonCubit>(context).execute(
                          usecase: OrderRegistrationUsecase(),
                          params: OrderRegistrationModel(
                            products: products,
                            createdDate: DateTime.now().toString(),
                            itemCount: products.length,
                            totalPrice: Cart.calculateCartSubtotal(products),
                            shippingAddress: _addressCon.text,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      autofocus: true,
      style: AppStyle.styleMedium16,
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(
        hintText: 'Shipping Address',
        hintStyle: AppStyle.styleMedium12,
      ),
    );
  }
}
