import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_favorites_products_usecase.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_favorites_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDisplayCubit(usecase: getIt<GetFavoritesProductsUsecase>())..displayProducts(),
      child: const Scaffold(
        appBar: CustomAppBar(title: Text("My Favorites")),
        body: MyFavoritesBody(),
      ),
    );
  }
}
