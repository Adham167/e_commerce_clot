import 'package:e_commerce_clot/features/category/presentation/views/categories_view.dart';
import 'package:e_commerce_clot/features/home/presentation/views/widgets/home_header.dart';
import 'package:e_commerce_clot/features/home/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [HomeHeader(), SearchField(),CategoriesView(),]);
  }
}
