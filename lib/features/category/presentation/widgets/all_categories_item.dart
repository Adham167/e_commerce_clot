import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class AllCategoriesItem extends StatelessWidget {
  const AllCategoriesItem({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondbackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration:  BoxDecoration(
                image: DecorationImage(image: NetworkImage(categoryEntity.image)),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 15),
             Text(categoryEntity.title, style: AppStyle.styleMedium24),
          ],
        ),
      ),
    );
  }
}
