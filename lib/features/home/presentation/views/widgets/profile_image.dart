import 'package:e_commerce_clot/core/entities/user_entity.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kSettingsView),
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.person, color: AppColors.primary),
      ),
    );
  }
}

class LoaddingProfileImage extends StatelessWidget {
  const LoaddingProfileImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: AppColors.primary),
    );
  }
}
