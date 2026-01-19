import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/login_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ButtonBlocListner extends StatelessWidget {
  const ButtonBlocListner({
    super.key,
    required TextEditingController email,
    required TextEditingController password,
  }) : _email = email, _password = password;

  final TextEditingController _email;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is ButtonSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      },
      child: LoginImplementation(email: _email, password: _password),
    );
  }
}