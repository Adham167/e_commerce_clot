import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_display_cubit/age_display_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/gender_cubit/gender_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/age_rang_widget.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/finish_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/gender_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GenderAndAgeBody extends StatelessWidget {
  const GenderAndAgeBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderCubit()),
        BlocProvider(create: (context) => AgeRangeCubit()),
        BlocProvider(create: (context) => AgeDisplayCubit()),
        BlocProvider(create: (context) => ButtonCubit()),
      ],
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          } else if (state is ButtonSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          }
        },
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tell us About yourself", style: AppStyle.styleBold24),
                  SizedBox(height: 30),
                  GenderButtonsWidget(),
                  SizedBox(height: 30),
                  Text("How old are you?", style: AppStyle.styleMedium24),
                  SizedBox(height: 30),
                  AgeRangWidget(),
                ],
              ),
            ),
            const Spacer(),
            FinishButton(userModel: userModel),
          ],
        ),
      ),
    );
  }
}
