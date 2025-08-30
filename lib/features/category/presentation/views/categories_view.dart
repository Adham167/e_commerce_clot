import 'package:e_commerce_clot/features/category/presentation/manager/categories_display_cubit/categories_display_cubit.dart';
import 'package:e_commerce_clot/features/category/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce_clot/features/category/presentation/widgets/see_all_cat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesDisplayLoaded) {
            return Column(
              children: [
                const SeeAllCatWidget(),
                CategoriesListView(categoryList: state.categories),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
