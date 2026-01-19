import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/core/utils/widgets/not_found_widget.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_products_by_title.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/views/products_grid_view.dart';
import 'package:e_commerce_clot/features/search/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDisplayCubit(usecase: getIt<GetProductsByTitleUsecase>()),
      child: Scaffold(
        appBar: const CustomAppBar(height: 90, title: SearchWidget()),
        body: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDisplayLoaded) {
              return state.productEntity.isEmpty
                  ? const NotFoundWidget()
                  : Column(
                    children: [
                      ProductsGridView(productList: state.productEntity),
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
