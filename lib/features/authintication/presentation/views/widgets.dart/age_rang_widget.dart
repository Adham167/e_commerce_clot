import 'package:e_commerce_clot/core/utils/app_bottom_sheet.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/ages.dart';
import 'package:flutter/material.dart';

class AgeRangWidget extends StatelessWidget {
  const AgeRangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(context, const Ages());
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondbackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("state"), const Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  }
}
