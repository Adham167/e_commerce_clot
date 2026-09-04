import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<SignUpUsecase>()),
      child: const Scaffold(body: SignUpBody()),
    );
  }
}
