import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/category/presentation/widgets/all_categories_item.dart';
import 'package:flutter/material.dart';

class AllCategoriesListView extends StatelessWidget {
  const AllCategoriesListView({super.key, required this.categoryList});
  final List<CategoryEntity> categoryList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder:
            (context, index) =>
                AllCategoriesItem(categoryEntity: categoryList[index]),
        separatorBuilder: (context, index) => const SizedBox(),
        itemCount: categoryList.length,
      ),
    );
  }
}

class LoaddingAllCategoriesListView extends StatelessWidget {
  const LoaddingAllCategoriesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const LoaddingAllCategoriesItem(),
        separatorBuilder: (context, index) => const SizedBox(),
        itemCount: 10,
      ),
    );
  }
}
