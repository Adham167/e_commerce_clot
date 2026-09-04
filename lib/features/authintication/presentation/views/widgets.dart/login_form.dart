import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_validators.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_action_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final user = UserSigninEntity(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      context.read<LoginCubit>().login(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextfield(
            text: "Enter Email",
            controller: _emailController,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            validator: AppValidators.validateEmail,
          ),

          const SizedBox(height: 16),

          CustomTextfield(
            text: "Enter Password",
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            isPassword: true,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submitForm(),
            validator: AppValidators.validatePasswordLogin,
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.bottomRight,
            child: CustomText(
              tex1: "Forgot Password? ",
              tex2: "Reset",
              ontap: () {
                GoRouter.of(context).push(AppRouter.kForgotPassword);
              },
            ),
          ),

          const SizedBox(height: 20),

          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomActionButton(
                title: "Continue",
                isLoading: state is LoginLoading,
                onPressed: _submitForm,
              );
            },
          ),
        ],
      ),
    );
  }
}
