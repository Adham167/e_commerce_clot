import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/category/presentation/manager/categories_display_cubit/categories_display_cubit.dart';
import 'package:e_commerce_clot/features/category/presentation/widgets/all_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesBody extends StatelessWidget {
  const AllCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shopping By Categories", style: AppStyle.styleBold24),
            const SizedBox(height: 16),
            BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
              builder: (context, state) {
                if (state is CategoriesDisplayLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoriesDisplayLoaded) {
                  return AllCategoriesListView(categoryList: state.categories,);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
