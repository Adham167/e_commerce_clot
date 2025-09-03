import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/widgets/product_listview_item.dart';
import 'package:flutter/material.dart';

class CategoryProductsGridView extends StatelessWidget {
  const CategoryProductsGridView({super.key, required this.productList});
  final List<ProductEntity> productList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ProductListviewItem(productEntity: productList[index]);
        },
      ),
    );
  }
}
