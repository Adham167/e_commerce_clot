import 'package:e_commerce_clot/core/utils/app_bottom_sheet.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_display_cubit/age_display_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeRangWidget extends StatelessWidget {
  const AgeRangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeRangeCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final ageDisplayCubit = context.read<AgeDisplayCubit>();
            final ageRangeCubit = context.read<AgeRangeCubit>();
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: ageDisplayCubit..displayAges()),
                  BlocProvider.value(value: ageRangeCubit),
                ],
                child: const Ages(),
              ),
            );
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
              children: [
                Text(state),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        );
      },
    );
  }
}