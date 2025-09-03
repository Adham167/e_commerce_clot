import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_products_by_category_id.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/views/category_products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductDisplayCubit(
            usecase: getIt<GetProductsByCategoryIdUsecase>(),
          )..displayProducts(params: categoryEntity.categoryId),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDisplayLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${categoryEntity.title} (${state.productEntity.length})",
                    style: AppStyle.styleBold24,
                  ),
                  const SizedBox(height: 12),

                  CategoryProductsGridView(productList: state.productEntity),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
