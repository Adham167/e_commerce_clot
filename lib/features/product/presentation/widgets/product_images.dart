import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Image.network(productEntity.images[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: productEntity.images.length,
      ),
    );
  }
}
