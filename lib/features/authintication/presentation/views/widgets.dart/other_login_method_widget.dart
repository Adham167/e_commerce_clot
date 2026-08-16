
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class OtherLoginMethodWidget extends StatelessWidget {
  const OtherLoginMethodWidget({
    super.key,
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(icon, width: 24, height: 24),
              const Spacer(),
              Text(name, style: AppStyle.styleMedium16),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
