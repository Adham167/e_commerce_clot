import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_new_in_usecase.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNewInBody extends StatelessWidget {
  const GetNewInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDisplayCubit(usecase: getIt<GetNewInUsecase>())
                ..displayProducts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("New IN", style: AppStyle.styleMedium16),
            const SizedBox(height: 16),
            BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
              builder: (context, state) {
                if (state is ProductDisplayLoading) {
                  return const Center(child: CircularProgressIndicator());
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
