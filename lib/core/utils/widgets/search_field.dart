import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        readOnly: true,
        onTap: () => GoRouter.of(context).push(AppRouter.kSearchView),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(1),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.textPrimary),
          hintText: "Search",
          hintStyle: AppStyle.styleMedium16,
        ),
      ),
    );
  }
}
