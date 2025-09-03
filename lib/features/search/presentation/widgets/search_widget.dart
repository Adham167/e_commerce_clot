import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/assets.dart';
import 'package:e_commerce_clot/features/product/presentation/manager/product_display_cubit/product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: true,
        onChanged: (data) {
          if (data.isEmpty) {
            BlocProvider.of<ProductDisplayCubit>(context).displayInitial();
          } else {
            BlocProvider.of<ProductDisplayCubit>(
              context,
            ).displayProducts(params: data);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(1),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Image.asset(Assets.imagesSearchIcon),
          hintText: "Search",
          hintStyle: AppStyle.styleMedium12,
        ),
      ),
    );
  }
}
