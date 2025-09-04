import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_colors_cubit/product_colors_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_quantity_cubit/product_quantity_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_sizes_cubit/product_sizes_cubit.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/add_to_bag_widget.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PorductDetailsView extends StatelessWidget {
  const PorductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
        BlocProvider(
          create: (context) => ProductColorsCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizesCubit(),
        ),
       
      ],
      child:Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: AddToBagWidget(productEntity: productEntity),
        body: ProductDetailsBody(productEntity: productEntity),
      ),
    );
  }
}
