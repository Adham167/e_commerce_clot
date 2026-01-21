import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/empty_widget.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/views/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesBody extends StatelessWidget {
  const MyFavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
        builder: (context, state) {
          if (state is ProductDisplayLoaded) {
            return state.productEntity.isEmpty
                ? const EmptyWidget()
                : Expanded(
                  child: ProductsGridView(productList: state.productEntity),
                );
          } else if (state is ProductDisplayLoading) {
            return const Expanded(child: LoaddingProductsGridView());
          } else if (state is ProductDisplayFailure) {
            return const Center(
              child: Text("Please try again", style: AppStyle.styleBold24),
            );
          }
          return Container();
        },
      ),
    );
  }
}
