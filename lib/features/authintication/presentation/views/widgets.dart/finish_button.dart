import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_reactive_button.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/gender_cubit/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondbackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: CustomReactiveButton(
            onPressed: () {
              userModel.gender =
                  BlocProvider.of<GenderCubit>(context).selectedIndex;
              userModel.age =
                  BlocProvider.of<AgeRangeCubit>(context).selectedAge;

              BlocProvider.of<ButtonCubit>(
                context,
              ).execute(usecase: SignupUsecase(), params: userModel);
            },
            title: "Finish",
          ),
        ),
      ),
    );
  }
}
