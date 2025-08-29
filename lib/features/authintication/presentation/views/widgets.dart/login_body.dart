import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_reactive_button.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: BlocProvider(
          create: (context) => ButtonCubit(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Sign In", style: AppStyle.styleBold32),
                const SizedBox(height: 16),
                CustomTextfield(text: "Enter Email", controller: _email),
                const SizedBox(height: 16),
                CustomTextfield(text: "Enter Password", controller: _password),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    tex1: "Forgot Password? ",
                    tex2: "Reset",
                    ontap: () {
                      GoRouter.of(context).push(AppRouter.KForgotPassword);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) {
                    return CustomReactiveButton(
                      onPressed: () {
                        final User = UserSigninModel(
                          email: _email.text,
                          password: _password.text,
                        );
                        BlocProvider.of<ButtonCubit>(
                          context,
                        ).execute(usecase: SigninUsecase(), params: User);
                      },
                      title: "Continue",
                    );
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    tex1: "Don't have an Account? ",
                    tex2: "Create One",
                    ontap: () {
                      GoRouter.of(context).push(AppRouter.KSignupView);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
