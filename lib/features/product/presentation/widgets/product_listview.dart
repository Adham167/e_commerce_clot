import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/core/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListview extends StatelessWidget {
  const ProductListview({super.key, required this.productList});
  final List<ProductEntity> productList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => ProductCard(productEntity: productList[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: productList.length,
      ),
    );
  }
}
