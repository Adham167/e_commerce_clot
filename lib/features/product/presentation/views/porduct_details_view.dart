import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/add_to_bag_widget.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_details_body.dart';
import 'package:flutter/material.dart';

class PorductDetailsView extends StatelessWidget {
  const PorductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar:  AddToBagWidget(productEntity: productEntity,),
      body: ProductDetailsBody(productEntity: productEntity),
    );
  }
}
