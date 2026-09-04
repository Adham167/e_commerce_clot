import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<SigninUsecase>()),
      child: const Scaffold(body: LoginBody()),
    );
  }
}
