import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeeAllCatWidget extends StatelessWidget {
  const SeeAllCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        children: [
          const Text("Categories", style: AppStyle.styleBold12),
          const Spacer(),
          GestureDetector(
            onTap:
                () => GoRouter.of(context).push(AppRouter.kAllCategoriesView),
            child: Text("See All", style: AppStyle.styleBold16),
          ),
        ],
      ),
    );
  }
}
