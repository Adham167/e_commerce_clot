import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/category/presentation/widgets/categories_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categoryList});
  final List<CategoryEntity> categoryList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoriesListItem(categoryEntity: categoryList[index],),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: categoryList.length,
      ),
    );
  }
}
