import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/category_products_body.dart';
import 'package:flutter/material.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key,  required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CategoryProductsBody(categoryEntity:  categoryEntity),
    );
  }
}
