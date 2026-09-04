import 'package:e_commerce_clot/core/utils/app_validators.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().sendResetEmail(
        _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextfield(
            text: "Enter Email Address",
            controller: _emailController,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submitForm(),
            validator: AppValidators.validateEmail,
          ),

          const SizedBox(height: 20),

          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return CustomActionButton(
                title: "Continue",
                isLoading: state is ForgotPasswordLoading,
                onPressed: _submitForm,
              );
            },
          ),
        ],
      ),
    );
  }
}
