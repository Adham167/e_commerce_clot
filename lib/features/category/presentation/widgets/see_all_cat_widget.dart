import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class SeeAllCatWidget extends StatelessWidget {
  const SeeAllCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        children: [
          Text("Categories", style: AppStyle.styleBold12),
          Spacer(),
          Text("See All", style: AppStyle.styleBold16),
        ],
      ),
    );
  }
}
