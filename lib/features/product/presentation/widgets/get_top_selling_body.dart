import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_top_selling_usecase.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetTopSellingBody extends StatelessWidget {
  const GetTopSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDisplayCubit(usecase: getIt<GetTopSellingUsecase>())
                ..displayProducts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Top Selling ", style: AppStyle.styleMedium16),
            const SizedBox(height: 20),
            BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
              builder: (context, state) {
                if (state is ProductDisplayLoading) {
                  return const LoaddingProductListview();
                } else if (state is ProductDisplayLoaded) {
                  return ProductListview(productList: state.productEntity);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
