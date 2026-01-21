import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(Icons.error_outline, color: AppColors.primary, size: 80),
          SizedBox(height: 6),
          Text("No Elements yet !", style: AppStyle.styleBold24),
        ],
      ),
    );
  }
}
