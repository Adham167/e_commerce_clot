import 'package:e_commerce_clot/features/order/presentation/manager/cubit/cart_products_cubit.dart';
import 'package:e_commerce_clot/features/order/presentation/widgets/cart_is_empty.dart';
import 'package:e_commerce_clot/features/order/presentation/widgets/check_out.dart';
import 'package:e_commerce_clot/features/order/presentation/widgets/product_ordered_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartProductsCubit()..displayCartProducts(),
      child: BlocBuilder<CartProductsCubit, CartProductsState>(
        builder: (context, state) {
          if (state is CartProductsLoading) {
            return const LoaddingProductOrderedListview();
          } else if (state is CartProductsLoaded) {
            return state.productList.isNotEmpty
                ? Stack(
                  children: [
                    ProductOrderedListview(products: state.productList),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CheckOut(productList: state.productList),
                    ),
                  ],
                )
                : const CartIsEmpty();
          } else if (state is CartProductsFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
