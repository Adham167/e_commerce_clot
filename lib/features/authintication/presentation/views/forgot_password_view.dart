import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(
        getIt<SendPasswordResetEmailUsecase>(),
      ),
      child: const Scaffold(
        appBar: CustomAppBar(),
        body: ForgotPasswordBody(),
      ),
    );
  }
}