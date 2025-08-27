import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/cubit/age_display_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/gender_cubit/gender_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/age_rang_widget.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/gender_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeBody extends StatelessWidget {
  const GenderAndAgeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderCubit()),
        BlocProvider(create: (context) => AgeRangeCubit()),
        BlocProvider(create: (context) => AgeDisplayCubit()),
      ],
      child: const Padding(
        padding:  EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
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
    );
  }
}
