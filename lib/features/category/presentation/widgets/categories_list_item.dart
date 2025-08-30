import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                categoryEntity.image)),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 10),
         Text(categoryEntity.title, style: AppStyle.styleMedium12),
      ],
    );
  }
}
