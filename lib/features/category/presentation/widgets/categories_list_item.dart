import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: categoryEntity.image,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        const SizedBox(height: 10),
        Text(categoryEntity.title, style: AppStyle.styleMedium12),
      ],
    );
  }
}

class LoaddingCategoriesListItem extends StatelessWidget {
  const LoaddingCategoriesListItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade50,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondBackground,
            ),
            child: const Icon(
              Icons.category,
              color: AppColors.secondBackground,
            ),
          ),

          const SizedBox(height: 10),
          Container(height: 10, width: 60, color: AppColors.secondBackground),
        ],
      ),
    );
  }
}
