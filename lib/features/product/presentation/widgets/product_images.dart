import 'package:cached_network_image/cached_network_image.dart';
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
          return CachedNetworkImageWidget(image: productEntity.images[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: productEntity.images.length,
      ),
    );
  }
}

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,

      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
