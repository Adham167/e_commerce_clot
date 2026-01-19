
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/gender_cubit/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderTile extends StatelessWidget {
  const GenderTile({super.key, required this.index, required this.gender});
  final int index;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<GenderCubit>(context).selectGender(index);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color:
                BlocProvider.of<GenderCubit>(context).selectedIndex == index
                    ? AppColors.primary
                    : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Text(gender, style: AppStyle.styleMedium16)),
        ),
      ),
    );
  }
}
