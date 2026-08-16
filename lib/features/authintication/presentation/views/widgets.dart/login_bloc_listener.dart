import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  bool _isLoadingDialogVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          _showLoadingDialog(context);
        }

        if (state is LoginFailure) {
          _showErrorDialog(
            context,
            state.errMessage,
          );
        }

        if (state is LoginSuccess) {
          _closeLoadingDialog();

          GoRouter.of(context).pushReplacement(
            AppRouter.kHomeView,
          );
        }
      },
      child: const LoginForm(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    if (_isLoadingDialogVisible) return;

    _isLoadingDialogVisible = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: AlertDialog(
            content: SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isLoadingDialogVisible = false;
    });
  }

  void _closeLoadingDialog() {
    if (!_isLoadingDialogVisible) return;

    Navigator.of(context).pop();
    _isLoadingDialogVisible = false;
  }

  void _showErrorDialog(
    BuildContext context,
    String message,
  ) {
    if (_isLoadingDialogVisible) {
      Navigator.of(context).pop();
      _isLoadingDialogVisible = false;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}